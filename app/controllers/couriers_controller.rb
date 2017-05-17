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
      @password = @data[:encrypted_password]
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
                     :name=>request.parameters[:name],
                      :status=>request.parameters[:status])
        @courier = Courier.find(request.parameters[:id])
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

  # GET get_courier_stations.json
  def get_courier_stations
    response.set_header("Access-Control-Allow-Origin", "*")
    courier_id = request.parameters[:courier_id]
    sql = "select station_addresses.* from station_addresses inner join couriers_stations
             on station_addresses.id = couriers_stations.station_id and couriers_stations.courier_id = "
    sql.concat(courier_id)
    station_address=StationAddress.connection.select_all(sql)
    respond_to do |format|
      format.json{ render json: {status:200,station_address:station_address} }
    end
  end

  #  POST allocate_couriers_stations.json
  def allocate_couriers_stations
    response.set_header("Access-Control-Allow-Origin", "*")
    @courier_id = request.parameters[:courier_id]
    @bind_stations = request.parameters[:courier_stations]
    # @stations = ActiveSupport::JSON.decode(@bind_stations)
    begin
      @delete = CouriersStation.where(courier_id:@courier_id).delete_all
    rescue
      puts "none"
    end

    if @bind_stations
      for station_id in @bind_stations
        @temp_bind = CouriersStation.new
        @temp_bind.courier_id = @courier_id
        @temp_bind.station_id = station_id
        @temp_bind.save
      end
    end


    respond_to do |format|
      format.json{ render json: {status:200, courier_id:@courier_id} }
    end

  end

  #  POST courier_shipping.json
  def courier_shipping
    response.set_header("Access-Control-Allow-Origin", "*")
    @order_id = request.parameters[:order_id]
    @time = request.parameters[:time]

    @waybill = Waybill.new
    @waybill["exp_time"] = @time
    @waybill["sender_type"] = "你的黑土骑士正在飞奔到你身边取件"
    @waybill["order_id"] = @order_id
    @waybill.save

    Order.update(@order_id,
                 :status=>2)

    respond_to do |format|
      format.json{ render json: {status:200} }
    end
  end

  #  POST courier_confirm_shipping.json
  def courier_confirm_shipping
    response.set_header("Access-Control-Allow-Origin", "*")
    @order_id = request.parameters[:order_id]
    @time = request.parameters[:time]

    @waybill = Waybill.new
    @waybill["exp_time"] = @time
    @waybill["sender_type"] = "你需要付钱洗衣了"
    @waybill["order_id"] = @order_id
    @waybill.save

    Order.update(@order_id,
                 :status=>3)

    respond_to do |format|
      format.json{ render json: {status:200} }
    end
  end


  # post courier_arrived.json
  def courier_arrived
    response.set_header("Access-Control-Allow-Origin", "*")
    @order_id = request.parameters[:order_id]
    @time = request.parameters[:time]

    @waybill = Waybill.new
    @waybill["exp_time"] = @time
    @waybill["sender_type"] = "你已经签收了你的干净衣服"
    @waybill["order_id"] = @order_id
    @waybill.save

    Order.update(@order_id,
                 :status=>7)
    respond_to do |format|
      format.json{ render json: {status:200} }
    end
  end




end