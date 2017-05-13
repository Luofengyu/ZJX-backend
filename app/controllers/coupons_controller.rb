class CouponsController < ApplicationController
  #get get_coupon_list.json
  def get_coupon_list
    response.set_header("Access-Control-Allow-Origin", "*")
    @coupon_list = CouponList.all
    respond_to do |format|
      format.json{ render json: {coupon_list:@coupon_list} }
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
    @new_coupon["valid_from"] = @today + @coupon_type.fixed_begin_term.day
    @new_coupon["valid_to"] = @today + @coupon_type.fixed_begin_term.day + @coupon_type.fixed_term.day
    @new_coupon.save

    respond_to do |format|
      format.json{ render json: {status:200, coupon:@new_coupon}}
    end
  end
end
