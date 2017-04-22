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
                            :tel=>request.parameters[:tel])
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

end
