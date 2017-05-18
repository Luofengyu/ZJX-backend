class UsersController < ApplicationController
  #POST /users/register.json
  def register
    response.set_header("Access-Control-Allow-Origin", "*")
    @data = request.parameters
    @email = @data[:email]
    begin
      @temp_user = User.find_by_email(@email)
      if !@temp_user
        createUser(@data)
      else
        respond_to do |format|
          format.json{render json:{status:555, message: "exist"}}
          format.html{render json:{status:555, message: "exist"}}
        end
      end
    rescue
      respond_to do |format|
        format.json{render json:{status:555,req:@data}}
        format.html{render json:{status:555,req:@data}}
      end
    end
  end

  #POST /users/login.json
  def login
    response.set_header("Access-Control-Allow-Origin", "*")
    begin
      @data = request.parameters
      @email = @data[:email]
      @password = @data[:encrypted_password]
      @user = User.find_by_email(@email)
      if @user
        if @user[:encrypted_password] == @password
          respond_to do |format|
            format.json{render json:{status:200,data:@user}}
            format.html{render json:{status:200,data:@user}}
          end
        else
          respond_to do |format|
            format.json{render json:{status:555, message:"wrong"}}
            format.html{render json:{status:555, message:"wrong"}}
          end
        end
      else
        respond_to do |format|
          format.json{render json:{status:555, message:"null"}}
          format.html{render json:{status:555, message:"null"}}
        end
      end
    rescue
      respond_to do |format|
        format.json{render json:{status:555}}
        format.html{render json:{status:555}}
      end
    end
  end

  def createUser(params)
    response.set_header("Access-Control-Allow-Origin", "*")
    @user = User.new
    @user.mobile = params[:mobile]
    @user.name = params[:name]
    @user.encrypted_password = params[:encrypted_password]
    @user.email = params[:email]
    if @user.save
      respond_to do |format|
        format.json{render json:{status:200,data:@user}}
        format.html{render json:{status:200,data:@user}}
      end
    else
      respond_to do |format|
        format.json{render json:{status:555, message:"fail", data:@user}}
        format.html{render json:{status:555, message:"fail", data:@user}}
      end
    end
  end

  # POST update_user.json
  def update_user
    response.set_header("Access-Control-Allow-Origin", "*")
    respond_to do |format|
      if User.update(request.parameters[:id],
                        :mobile=>request.parameters[:mobile],
                        :email=>request.parameters[:email],
                        :encrypted_password=>request.parameters[:encrypted_password],
                        :name=>request.parameters[:name])
        @user = User.find(request.parameters[:id]);
        format.json { render json: {status: 200, data:@user }}
      else
        format.json { render json: {status: 200, message: "update successfully" }}
      end
    end
  end

  # POST delete_user.json
  def delete_user
    response.set_header("Access-Control-Allow-Origin", "*")
    @user = User.find(request.parameters[:id])
    if @user.delete
      respond_to do |format|
        format.json { render json: {status: 200, message: "delete successfully" } }
      end
    end
  end

  # GET index
  def index
    response.set_header("Access-Control-Allow-Origin", "*")
    @user_list = User.all
    respond_to do |format|
      format.html { render json: {status: 200, data:@user_list } }
      format.json { render json: {status: 200, data:@user_list } }
    end
  end

  # GET get_item.json
  def get_item
    response.set_header("Access-Control-Allow-Origin", "*")
    @user_id = request.parameters[:user_id]
    sql1 = "select users.*,user_cards.* from users inner join user_cards
           on user_cards.user_id = users.id and user_id= "
    sql1.concat(@user_id)
    @items = Item.connection.select_all(sql1)
    sql2 = "select * from user_card_logs where user_id = "
    sql2.concat(@user_id)
    @logs = Item.connection.select_all(sql2)
    respond_to do |format|
      format.json{render json: {status: 200,items: @items,logs:@logs}}
    end
  end

  #POST direct_charge.json
  def direct_charge
    response.set_header("Access-Control-Allow-Origin", "*")
    @user_id = request.parameters[:user_id]
    @real_money = request.parameters[:real_money]
    @fake_money = request.parameters[:fake_money]
    @user_card = UserCard.find_by_user_id(@user_id)
    real_money = @real_money.to_f + @user_card[:real_money].to_f
    puts (real_money)
    fake_money = @fake_money.to_f + @user_card[:fake_money].to_f
    UserCard.update(@user_card[:id],
                    :real_money=>real_money,
                    :fake_money=>fake_money)
    @user_card_log = UserCardLog.new
    @user_card_log.real_money = @real_money
    @user_card_log.fake_money = @fake_money
    @user_card_log.user_id = @user_id
    @user_card_log.kind = 0
    @user_card_log.loggable_type = "用户充值"
    @user_card_log.loggable_id = 0
    if @user_card_log.save
      respond_to do |format|
        format.json{render json: {status: 200,log: @user_card_log}}
      end
    end
  end

  # GET charge_list.json
  def charge_list
    response.set_header("Access-Control-Allow-Origin", "*")
    @list = UserCardChargeSetting.all
    respond_to do |format|
      format.json{render json: {status: 200,list: @list}}
    end
  end

  # POST youhui_charge.json
  def youhui_charge
    response.set_header("Access-Control-Allow-Origin", "*")
    @user_id = request.parameters[:user_id]
    @setting_id = request.parameters[:setting_id]
    @setting = UserCardChargeSetting.find(@setting_id)

    @user_card = UserCard.find_by_user_id(@user_id)
    real_money = @setting[:min].to_f + @user_card[:real_money].to_f
    puts (real_money)
    fake_money = @setting[:money_give].to_f + @user_card[:fake_money].to_f

    UserCard.update(@user_card[:id],
                    :real_money=>real_money,
                    :fake_money=>fake_money)

    @user_card_log = UserCardLog.new
    @user_card_log.real_money = @setting[:min]
    @user_card_log.fake_money = @setting[:money_give]
    @user_card_log.user_id = @user_id
    @user_card_log.kind = 0
    @user_card_log.loggable_type = "操作员充值"
    @user_card_log.loggable_id = 1
    @user_card_log.save
    respond_to do |format|
      format.json{render json: {status: 200,log: @user_card_log}}
    end
  end

  # POST create_yonghui_charge_setting.json
  def create_yonghui_charge_setting
    response.set_header("Access-Control-Allow-Origin", "*")
    @min = request.parameters[:min]
    @give = request.parameters[:give]
    @setting = UserCardChargeSetting.new()
    @setting.min = @min
    @setting.money_give = @give
    @setting.save()
    respond_to do |format|
      format.json{render json: {status: 200}}
    end
  end

  # GET wallet.json
  def wallet
    response.set_header("Access-Control-Allow-Origin", "*")
    @user_id = request.parameters[:user_id]
    sql1 = "select (user_cards.real_money+user_cards.fake_money) as money
             from user_cards where user_id= "
    sql1.concat(@user_id)
    @wallet = Item.connection.select_all(sql1)
    sql2 = "select * from user_card_logs where user_id = "
    sql2.concat(@user_id)
    @logs = Item.connection.select_all(sql2)
    respond_to do |format|
      format.json{render json: {status: 200,wallet: @wallet,logs:@logs}}
    end
  end

  # POST pay.json
  def pay
    response.set_header("Access-Control-Allow-Origin", "*")
    @user_id = request.parameters[:user_id]
    @order_id = request.parameters[:order_id]
    # youhuiquan id
    @user_coupon_id = request.parameters[:coupon_id]
    @order_promotion_id = request.parameters[:order_promotion_id]

    # 查询用户余额balance
    @wallet = UserCard.find_by_user_id(@user_id)
    real_money = @wallet[:real_money]
    fake_money = @wallet[:fake_money]
    balance = @wallet[:real_money] + @wallet[:fake_money]


    # 查找订单总价total_price
    @order = Order.find(@order_id)
    total_price = @order[:total_price]

    #youhuiquan
    if (@user_coupon_id and @order_promotion_id)
      @user_coupon = Coupon.find(@user_coupon_id)
      @order_promotion = OrderPromotion.find(@order_promotion_id)
      case @order_promotion.kind
        when 1
          total_price -= @order_promotion.discount
        when 2
          total_price *= @order_promotion.discount
        # 3
      end
    end

    if(total_price > balance)
      respond_to do |format|
        format.json{render json: {status: 400,message: "您的账户余额不足"}}
      end
    else
      if (real_money >= total_price)
        remain_money = real_money - total_price
        UserCard.update(@wallet[:id],
                        :real_money=>remain_money)

        # 添加流水记录
        @user_card_log = UserCardLog.new()
        @user_card_log.real_money = total_price
        @user_card_log.fake_money = 0
        @user_card_log.user_id = @user_id
        @user_card_log.kind = 1
        @user_card_log.loggable_type = "用户支付"
        @user_card_log.loggable_id = 1
        @user_card_log.save()
      else
        remain_money = balance - total_price
        UserCard.update(@wallet[:id],
                        :real_money=>0,
                        :fake_money=>remain_money)
        # 添加流水记录
        @user_card_log = UserCardLog.new()
        @user_card_log.real_money = real_money
        @user_card_log.fake_money = total_price - real_money
        @user_card_log.user_id = @user_id
        @user_card_log.kind = 1
        @user_card_log.loggable_type = "用户支付"
        @user_card_log.loggable_id = 1
        @user_card_log.save()

      end

      # 更新订单状态变成已支付
      Order.update(@order_id,
                   :status=>4,
                    :total_price => total_price)

      @waybill = Waybill.new
      @waybill["exp_time"] = Time.new
      @waybill["sender_type"] = "你的黑土骑士正载着你的衣服奔向洗衣房"
      @waybill["order_id"] = @order_id
      @waybill.save

      respond_to do |format|
        format.json{render json: {status: 200,message: "支付成功"}}
      end
    end

  end

  # 退款 post refunds.json
  def refunds
    response.set_header("Access-Control-Allow-Origin", "*")
    @user_id = request.parameters[:user_id]
    @order_id = request.parameters[:order_id]

    @wallet = UserCard.find_by_user_id(@user_id)
    # 查找订单总价total_price
    @order = Order.find(@order_id)
    @refund_money = @order[:total_price]

    @update_fake_money += @wallet[:fake_money] + @refund_money
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
  end

  # 修改订单状态(不退钱)
  # post cancel_order.json
  def cancel_order
    response.set_header("Access-Control-Allow-Origin", "*")
    @user_id = request.parameters[:user_id]
    @order_id = request.parameters[:order_id]

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
