class FactoriesController < ApplicationController
  #POST /factories/register
  def register
    response.set_header("Access-Control-Allow-Origin", "*")
    @data = request.parameters
    @email = @data[:email]
    begin
      @temp_factory = Factory.find_by_email(@email)
      if !@temp_factory
        createFactory(@data)
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

  #POST /factories/login
  def login
    response.set_header("Access-Control-Allow-Origin", "*")
    begin
      @data = request.parameters
      @mobile = @data[:mobile]
      @password = @data[:encrypted_password]
      @factory = Factory.find_by_mobile(@mobile)
      if @factory
        if @factory[:encrypted_password] == @password
          respond_to do |format|
            format.json{render json:{status:200,data:@factory}}
            format.html{render json:{status:200,data:@factory}}
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

  def createFactory(params)
    response.set_header("Access-Control-Allow-Origin", "*")
    @factory = Factory.new
    @factory.mobile = params[:mobile]
    @factory.name = params[:name]
    @factory.encrypted_password = params[:encrypted_password]
    @factory.email = params[:email]
    @factory.tel = params[:tel]
    if @factory.save
      respond_to do |format|
        format.json{render json:{status:200,data:@factory}}
        format.html{render json:{status:200,data:@factory}}
      end
    else
      respond_to do |format|
        format.json{render json:{status:555, message:"fail", data:@factory}}
        format.html{render json:{status:555, message:"fail", data:@factory}}
      end
    end
  end

  # POST update_factory.json
  def update_factory
    response.set_header("Access-Control-Allow-Origin", "*")
    respond_to do |format|
      if Factory.update(request.parameters[:id],
                            :mobile=>request.parameters[:mobile],
                            :email=>request.parameters[:email],
                            :encrypted_password=>request.parameters[:encrypted_password],
                            :name=>request.parameters[:name],
                            :tel=>request.parameters[:tel],
                            :status=>request.parameters[:status])
        @factory = Factory.find(request.parameters[:id]);
        format.json { render json: {status: 200, data:@factory }}
      else
        format.json { render json: {status: 200, message: "productItems update successfully" }}
      end
    end
  end

  # POST delete_factory.json
  def delete_factory
    response.set_header("Access-Control-Allow-Origin", "*")
    @factory = Factory.find(request.parameters[:id])
    if @factory.delete
      respond_to do |format|
        format.json { render json: {status: 200, message: "delete successfully" } }
      end
    end
  end

  # GET index
  def index
    response.set_header("Access-Control-Allow-Origin", "*")
    @factory_list = Factory.all
    respond_to do |format|
      format.html { render json: {status: 200, data:@factory_list } }
      format.json { render json: {status: 200, data:@factory_list } }
    end
  end

  # GET get_factory_stations.json
  def get_factory_stations
    response.set_header("Access-Control-Allow-Origin", "*")
    factory_id = request.parameters[:factory_id]
    sql = "select station_addresses.* from station_addresses inner join factories_stations
             on station_addresses.id = factories_stations.station_id and factories_stations.factory_id = "
    sql.concat(factory_id)
    station_address=StationAddress.connection.select_all(sql)
    respond_to do |format|
      format.json{ render json: {status:200,station_address:station_address} }
    end
  end

  #  POST allocate_factories_stations.json
  def allocate_factories_stations
    response.set_header("Access-Control-Allow-Origin", "*")
    @factory_id = request.parameters[:factory_id]
    @bind_stations = request.parameters[:factory_stations]
    # @stations = ActiveSupport::JSON.decode(@bind_stations)
    begin
      @delete = FactoriesStation.where(factory_id:@factory_id).delete_all
    rescue
      puts "none"
    end

    if @bind_stations
      for station_id in @bind_stations
        @temp_bind = FactoriesStation.new
        @temp_bind.factory_id = @factory_id
        @temp_bind.station_id = station_id
        @temp_bind.save
      end
    end

    respond_to do |format|
      format.json{ render json: {status:200, factory_id:@factory_id} }
    end
  end


  #  POST factory_washing.json
  def factory_washing
    response.set_header("Access-Control-Allow-Origin", "*")
    @order_id = request.parameters[:order_id]
    @time = request.parameters[:time]

    @waybill = Waybill.new
    @waybill["exp_time"] = @time
    @waybill["sender_type"] = "你的脏衣服正在被洗衣机蹂躏"
    @waybill["order_id"] = @order_id
    @waybill.save

    Order.update(@order_id,
                  :status=>5)

    respond_to do |format|
      format.json{ render json: {status:200} }
    end
  end
  # post factory_finish_washing.json
  def factory_finish_washing
    response.set_header("Access-Control-Allow-Origin", "*")
    @order_id = request.parameters[:order_id]
    @time = request.parameters[:time]

    @waybill = Waybill.new
    @waybill["exp_time"] = @time
    @waybill["sender_type"] = "你的白云骑士正带着你的干净衣服奔向你身边"
    @waybill["order_id"] = @order_id
    @waybill.save

    Order.update(@order_id,
                 :status=>6)
    respond_to do |format|
      format.json{ render json: {status:200} }
    end
  end

  # POST change_factory_cal_rules.json
  def change_factory_cal_rules
    response.set_header("Access-Control-Allow-Origin", "*")
    @base = request.parameters[:base]
    @extra = request.parameters[:extra]
    @cal_rules = CalRule.find_by_person_type(1)
    @cal_rules.update_attribute(:base,@base)
    @cal_rules.update_attribute(:extra,@extra)
    respond_to do |format|
      format.json{ render json: {status:200,cal_rules:@cal_rules} }
    end
  end

end
