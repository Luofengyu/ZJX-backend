class CouponsController < ApplicationController
  # post create_coupons.json
  # validity_type 1- 永久  2-临时
  def create_coupons
    response.set_header("Access-Control-Allow-Origin", "*")
    @name = request.parameters[:name]
    @validity_type = request.parameters[:validity_type]
    @start = request.parameters[:start]
    @end = request.parameters[:end]
    @use_delay = request.parameters[:use_delay]
    @fixed_day= request.parameters[:fixed_day]
    # 折扣类型
    @kind = request.parameters[:type]
    # 前提约束
    @premise = request.parameters[:premise]
    @discount = request.parameters[:discount]

    @coupon = CouponList.new
    @coupon["name"] = @name
    @coupon["validity_type"] = @validity_type
    @coupon["valid_from"] = @start
    @coupon["valid_to"] = @end
    @coupon["fixed_begin_term"] = @use_delay
    @coupon["fixed_term"] = @fixed_day
    @coupon.save

    @order_promotion = OrderPromotion.new
    @order_promotion["kind"] = @kind
    @order_promotion["premise"] = @premise
    @order_promotion["discount"] = @discount
    @order_promotion["coupon_list_id"] = String(@coupon.id)
    @order_promotion.save

    respond_to do |format|
      format.json{ render json: {status:200} }
    end

  end



  # 建立优惠规则 1-满减  2-打折 3-红包
  #post create_order_promotions
  def create_order_promotions
    response.set_header("Access-Control-Allow-Origin", "*")
    @coupon_id = request.parameters[:coupon_id]
    # 折扣类型
    @kind = request.parameters[:type]
    # 前提约束
    @premise = request.parameters[:premise]
    @discount = request.parameters[:discount]
    @order_promotion = OrderPromotion.new
    @order_promotion["kind"] = @kind
    @order_promotion["premise"] = @premise
    @order_promotion["discount"] = @discount
    @order_promotion["coupon_id"] = @coupon_id
    @order_promotion.save
    respond_to do |format|
      format.json{ render json: {status:200} }
    end
  end


  #get get_coupon_list.json
  def get_coupon_list
    response.set_header("Access-Control-Allow-Origin", "*")
    @coupon_list = CouponList.all
    respond_to do |format|
      format.json{ render json: {coupon_list:@coupon_list} }
    end
  end

  #post delete_coupon.json
  def delete_coupon
    response.set_header("Access-Control-Allow-Origin", "*")
    @coupon_id = request.parameters[:coupon_id]
    OrderPromotion.where(coupon_list_id:@coupon_id).delete_all
    CouponList.where(id:@coupon_id).delete_all
    respond_to do |format|
      format.json{ render json: {status:200} }
    end
  end

  #get get_user_coupons.json
  def get_user_coupons
    response.set_header("Access-Control-Allow-Origin", "*")
    @user_id = request.parameters[:user_id]
    @coupons = Coupon.find_by_user_id(@user_id)
    respond_to do |format|
      format.json{ render json: {coupons:@coupons} }
    end
  end

  #post send_coupons.json
  def send_coupons
    response.set_header("Access-Control-Allow-Origin", "*")
    @user_id = request.parameters[:user_id]
    @choosen_coupon = request.parameters[:coupon_id]
    @coupon_type = CouponList.find(@choosen_coupon)
    @today = Time.new
    @new_coupon = Coupon.new
    @new_coupon["coupon_list_id"] = @choosen_coupon
    @new_coupon["user_id"] = @user_id
    @new_coupon["vaild_from"] = @today + @coupon_type.fixed_begin_term.day
    @new_coupon["valid_to"] = @today + @coupon_type.fixed_begin_term.day + @coupon_type.fixed_term.day
    @new_coupon.save

    respond_to do |format|
      format.json{ render json: {status:200, coupon:@new_coupon}}
    end
  end
end
