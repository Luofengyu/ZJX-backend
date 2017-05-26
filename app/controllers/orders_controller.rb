class OrdersController < ApplicationController

  # GET /get_user_orders.json
  def get_user_orders
    response.set_header("Access-Control-Allow-Origin", "*")
    @user_id = request.parameters[:user_id];
    sql1="select orders.*,orders_status.status_desc,categories.name as category_name,user_addresses.*,
          orders.id as id, max(waybills.created_at) as date,max(waybills.status) as waybills_status,
          max(waybills.exp_time) as qtime,max(waybills.sender_type) as waybills_desc from orders
    inner join orders_status on orders.status = orders_status.id and orders.user_id="
    sql1.concat(@user_id)
    sql2=" inner join categories on categories.id = orders.category_id
    inner join user_addresses on user_addresses.id = orders.address_id
    inner join waybills on orders.id = waybills.order_id
    group by waybills.order_id;"
    sql1.concat(sql2)
    orders=Order.connection.select_all(sql1)

    respond_to do |format|
      format.json{render json: {status: 200,orders: orders}}
    end
  end

  # GET /get_all_orders.json
  def get_all_orders
    response.set_header("Access-Control-Allow-Origin", "*")
    sql="select orders.*,orders_status.status_desc,categories.name as category_name,user_addresses.city as city,
    user_addresses.region as region, user_addresses.community as community,
    user_addresses.house_number as house_number,user_addresses.name as name,
    user_addresses.tel as tel
    from orders
    inner join orders_status on orders.status = orders_status.id
    inner join categories on categories.id = orders.category_id
    inner join user_addresses on user_addresses.id = orders.address_id"
    orders=Order.connection.select_all(sql)

    respond_to do |format|
      format.json{render json: {status: 200,orders: orders}}
    end
  end

  # GET /get_all_cancel_orders.json
  def get_all_cancel_orders
    response.set_header("Access-Control-Allow-Origin", "*")
    sql="select * from orders where status=9"
    orders=Order.connection.select_all(sql)

    respond_to do |format|
      format.json{render json: {status: 200,orders: orders}}
    end
  end

  # post /create_order.json
  def create_order
    response.set_header("Access-Control-Allow-Origin", "*")
    @products = request.parameters[:product]
    @address_id= request.parameters[:address_id]
    @user_id= request.parameters[:user_id]
    @time = request.parameters[:time]
    @category_id = request.parameters[:category_id]
    @order_products =  ActiveSupport::JSON.decode(@products)
    puts @order_products

    @waybill = Waybill.new
    @waybill["exp_time"] = @time
    @waybill["sender_type"] = "骑手即将取件"
    @waybill.save


    @order_item = Order.new
    @order_item["address_id"] = @address_id
    @order_item["category_id"] = @category_id
    @order_item["user_id"] = @user_id
    @order_item["address_id"] = @address_id
    @order_item["waybill_id"] = String(@waybill.id)
    @order_item["factory_id"] = 1
    @order_item.save


    Waybill.update(String(@waybill.id),
                    :order_id=>String(@order_item.id),
                    :status=>1)
    @total_price = 0

    # items table
    for @item in @order_products
      @product_id, @number, @price = @item.split('#')
      @item = Item.new()
      @item["product_id"] = @product_id
      @item["order_id"] = String(@order_item.id)
      @item["amount"] = @number
      @item["price"] = @price
      @item.save
      @total_price += Integer(@number)*Integer(@price)
    end
    puts "total_price"
    puts @total_price
    Order.update(String(@order_item.id),
                :total_price=>@total_price,
                :status=>1)



    respond_to do |format|
      format.json { render json:{status: 200}}
    end
  end

  # post cancel_refund_order.json
  def cancel_refund_order
    response.set_header("Access-Control-Allow-Origin", "*")
    @user_id = request.parameters[:user_id]
    @order_id = request.parameters[:order_id]
    @order = Order.find(@order_id)

    sql="select * from waybills where order_id="+String(@order_id)+" and status=4"
    @pay_already=Waybill.connection.select_all(sql)

    if @pay_already != nil
      @wallet = UserCard.find_by_user_id(@user_id)
      # 查找订单总价total_price
      @refund_money = @order[:total_price]
      @update_fake_money = @wallet[:fake_money] + @refund_money
      UserCard.update(@wallet[:id],
                      :fake_money=>@update_fake_money)
      @balance = @wallet[:real_money] + @update_fake_money

      # 修改订单信息
      Order.update(@order_id,
                   :status=>11)

      # 物流信息
      @waybill = Waybill.new
      @waybill["exp_time"] = Time.new
      @waybill["sender_type"] = "完成退款"
      @waybill["order_id"] = @order_id
      @waybill["status"] = 11
      @waybill.save


      respond_to do |format|
        format.json{render json: {status: 200, message:"退款成功", order:@order, balance:@balance}}
      end
    else
      # 修改订单信息
      Order.update(@order_id,
                   :status=>10)
      # 物流信息
      @waybill = Waybill.new
      @waybill["exp_time"] = Time.new
      @waybill["sender_type"] = "取消订单"
      @waybill["order_id"] = @order_id
      @waybill["status"] = 10
      @waybill.save

      respond_to do |format|
        format.json{render json: {status: 200, message:"取消订单成功", order:@order}}
      end
    end
  end

  #post refuse_cancel_order.json
  def refuse_cancel_order
    response.set_header("Access-Control-Allow-Origin", "*")
    @user_id = request.parameters[:user_id]
    @order_id = request.parameters[:order_id]
    @order = Order.find(@order_id)
    Waybill.where(order_id:@order_id, status:9).delete_all
    sql="select * from waybills where order_id="+String(@order_id)+" order by status desc"
    @waybill_list = Waybill.connection.select_all(sql)
    @status = 0
    for @waybill in @waybill_list
      if @waybill["status"] > @status
        @status = @waybill["status"]
      end
    end
    puts @status
    Order.update(@order_id,
                 :status=>@status)
    respond_to do |format|
      format.json{render json: {status: 200, message:"拒绝退单", order:@order}}
    end
  end
end
