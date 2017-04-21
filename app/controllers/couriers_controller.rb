class CouriersController < ApplicationController

  #POST /couriers/register.json
  def register
    response.set_header("Access-Control-Allow-Origin", "*")
    @data = request.parameters
    @mobile = @data[:mobile]
    begin
      @temp_courier = Courier.find_by_mobile(@mobile)
      if @temp_courier
        respond_to do |format|
          format.json{render json:{status:555, message: "exist"}}
          format.html{render json:{status:555, message: "exist"}}
        end
      else
        createCouries(@data)
      end
    rescue
      respond_to do |format|
        format.json{render json:{status:555, message:"fail"}}
        format.html{render json:{status:555, message:"fail"}}
      end
    end
  end

  #POST /couriers/login.json
  def login
    response.set_header("Access-Control-Allow-Origin", "*")
    begin
      @data = request.parameters
      @mobile = @data[:mobile]
      @password = @data[:password]
      @courier = Courier.find_by_mobile(@mobile)
      if @courier
        if @courier[:encrypted_password] == @password
          respond_to do |format|
            format.json{render json:{status:200,data:@courier}}
            format.html{render json:{status:200,data:@courier}}
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

  def createCouries(params)
    response.set_header("Access-Control-Allow-Origin", "*")
    @courier = Courier.new
    @courier.mobile = params[:mobile]
    @courier.name = params[:name]
    @courier.encrypted_password = params[:encrypted_password]
    @courier.status = params[:status]
    @courier.email = params[:email]
    if @courier.save
      respond_to do |format|
        format.json{render json:{status:200,data:@courier}}
        format.html{render json:{status:200,data:@courier}}
      end
    else
      respond_to do |format|
        format.json{render json:{status:555, message:"fail", data:@courier}}
        format.html{render json:{status:555, message:"fail", data:@courier}}
      end
    end
  end


  # POST update_courier.json
  def update_courier
    response.set_header("Access-Control-Allow-Origin", "*")
    respond_to do |format|
      if Courier.update(request.parameters[:id],
                     :mobile=>request.parameters[:mobile],
                     :email=>request.parameters[:email],
                     :encrypted_password=>request.parameters[:encrypted_password],
                     :name=>request.parameters[:name])
        @courier = Courier.find(request.parameters[:id]);
        format.json { render json: {status: 200, data:@courier }}
      else
        format.json { render json: {status: 200, message: "update successfully" }}
      end
    end
  end

  # POST delete_courier.json
  def delete_courier
    response.set_header("Access-Control-Allow-Origin", "*")
    @courier = Courier.find(request.parameters[:id])
    if @courier.delete
      respond_to do |format|
        format.json { render json: {status: 200, message: "delete successfully" } }
      end
    end
  end

  # GET index
  def index
    response.set_header("Access-Control-Allow-Origin", "*")
    @courier_list = Courier.all
    respond_to do |format|
      format.html { render json: {status: 200, data:@courier_list } }
      format.json { render json: {status: 200, data:@courier_list } }
    end
  end


  # private
  # # Use callbacks to share common setup or constraints between actions.
  # def set_courier
  #   @courier = Courier.find(params[:id])
  # end
  #
  # # Never trust parameters from the scary internet, only allow the white list through.
  # def courier_params
  #   params.require(:courier).permit(:id , :mobile, :email, :encrypted_password, :reset_password_token,
  #                                   :reset_password_sent_at, :remember_created_at,
  #   :sign_in_count,:current_sign_in_at,:last_sign_in_at,:current_sign_in_ip,:last_sign_in_ip,
  #   :locked_at,:name,:status,:created_at,:updated_at)
  # end
end