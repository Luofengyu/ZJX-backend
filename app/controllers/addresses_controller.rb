class AddressesController < ApplicationController
  # GET get_user_address.json
  def get_user_address
    response.set_header("Access-Control-Allow-Origin", "*")
    @user_address = UserAddress.where([ "user_id = ? ",request.parameters[:user_id] ] ).all
    respond_to do |format|
      format.json{render json: {status: 200,user_address: @user_address}}
    end
  end

  # POST create_user_address.json
  def create_user_address
    response.set_header("Access-Control-Allow-Origin", "*")
    @user_address = UserAddress.new()
    @user_address.name = request.parameters[:name]
    @user_address.tel = request.parameters[:tel]
    @user_address.sex = request.parameters[:sex]
    @user_address.city = request.parameters[:city]
    @user_address.region = request.parameters[:region]
    @user_address.community = request.parameters[:community]
    @user_address.house_number = request.parameters[:house_number]
    @user_address.user_id = request.parameters[:user_id]
    @user_address.lat = request.parameters[:lat]
    @user_address.lng = request.parameters[:lng]
    respond_to do |format|
      if @user_address.save
        format.json { render json: {status: 200, user_address: @user_address }}
      else
        format.json { render json: {status: 400, message: "user_address created unsuccessfully" }}
      end
    end
  end

  # POST update_user_address.json
  def update_user_address
    response.set_header("Access-Control-Allow-Origin", "*")
    respond_to do |format|
      if UserAddress.update(request.parameters[:id],
                         :name=>request.parameters[:name],
                         :tel=>request.parameters[:tel],
                         :sex=>request.parameters[:sex],
                         :city=>request.parameters[:city],
                         :region=>request.parameters[:region],
                         :community=>request.parameters[:community],
                         :house_number=>request.parameters[:house_number],
                         :lat=>request.parameters[:lat],
                         :lng=>request.parameters[:lng])
        @user_address = UserAddress.find(request.parameters[:id]);
        format.json { render json: {status: 200, user_address: @user_address }}
      else
        format.json { render json: {status: 400, message: "user_address update successfully" }}
      end
    end
  end

  # POST delete_user_address.json
  def delete_user_address
    response.set_header("Access-Control-Allow-Origin", "*")
    respond_to do |format|
      @user_address = UserAddress.find(request.parameters[:id])
      if @user_address.delete
        format.json { render json: {status: 200, message: "user_address delete successfully" } }
      else
        format.json { render json: {status: 400, message: "user_address delete unsuccessfully" }}
      end
    end
  end

  ###############################################################fenge

  # GET get_factory_address.json
  def get_factory_address
    response.set_header("Access-Control-Allow-Origin", "*")
    @factory_address = FactoryAddress.where([ "factory_id = ? ",request.parameters[:factory_id] ] ).all
    respond_to do |format|
      format.json{render json: {status: 200,factory_address: @factory_address}}
    end
  end

  # POST create_factory_address.json
  def create_factory_address
    response.set_header("Access-Control-Allow-Origin", "*")
    @factory_address = FactoryAddress.new()
    @factory_address.name = request.parameters[:name]
    @factory_address.tel = request.parameters[:tel]
    @factory_address.sex = request.parameters[:sex]
    @factory_address.city = request.parameters[:city]
    @factory_address.region = request.parameters[:region]
    @factory_address.community = request.parameters[:community]
    @factory_address.house_number = request.parameters[:house_number]
    @factory_address.factory_id = request.parameters[:factory_id]
    @factory_address.lat = request.parameters[:lat]
    @factory_address.lng = request.parameters[:lng]
    respond_to do |format|
      if @factory_address.save
        format.json { render json: {status: 200, factory_address: @factory_address }}
      else
        format.json { render json: {status: 400, message: "factory_address created unsuccessfully" }}
      end
    end
  end

  # POST update_factory_address.json
  def update_factory_address
    response.set_header("Access-Control-Allow-Origin", "*")
    respond_to do |format|
      if FactoryAddress.update(request.parameters[:id],
                            :name=>request.parameters[:name],
                            :tel=>request.parameters[:tel],
                            :sex=>request.parameters[:sex],
                            :city=>request.parameters[:city],
                            :region=>request.parameters[:region],
                            :community=>request.parameters[:community],
                            :house_number=>request.parameters[:house_number],
                            :lat=>request.parameters[:lat],
                            :lng=>request.parameters[:lng])
        @factory_address = FactoryAddress.find(request.parameters[:id]);
        format.json { render json: {status: 200, factory_address: @factory_address }}
      else
        format.json { render json: {status: 400, message: "factory_address update successfully" }}
      end
    end
  end

  # POST delete_factory_address.json
  def delete_factory_address
    response.set_header("Access-Control-Allow-Origin", "*")
    respond_to do |format|
      @factory_address = FactoryAddress.find(request.parameters[:id])
      if @factory_address.delete
        format.json { render json: {status: 200, message: "factory_address delete successfully" } }
      else
        format.json { render json: {status: 400, message: "factory_address delete unsuccessfully" }}
      end
    end
  end

  ###############################################################################

  # GET get_courier_address.json
  def get_courier_address
    response.set_header("Access-Control-Allow-Origin", "*")
    @courier_address = CourierAddress.where([ "courier_id = ? ",request.parameters[:courier_id] ] ).all
    respond_to do |format|
      format.json{render json: {status: 200,courier_address: @courier_address}}
    end
  end

  # POST create_courier_address.json
  def create_courier_address
    response.set_header("Access-Control-Allow-Origin", "*")
    @courier_address = CourierAddress.new()
    @courier_address.name = request.parameters[:name]
    @courier_address.tel = request.parameters[:tel]
    @courier_address.sex = request.parameters[:sex]
    @courier_address.city = request.parameters[:city]
    @courier_address.region = request.parameters[:region]
    @courier_address.community = request.parameters[:community]
    @courier_address.house_number = request.parameters[:house_number]
    @courier_address.courier_id = request.parameters[:courier_id]
    @courier_address.lat = request.parameters[:lat]
    @courier_address.lng = request.parameters[:lng]
    respond_to do |format|
      if @courier_address.save
        format.json { render json: {status: 200, courier_address: @courier_address }}
      else
        format.json { render json: {status: 400, message: "courier_address created unsuccessfully" }}
      end
    end
  end

  # POST update_courier_address.json
  def update_courier_address
    response.set_header("Access-Control-Allow-Origin", "*")
    respond_to do |format|
      if CourierAddress.update(request.parameters[:id],
                               :name=>request.parameters[:name],
                               :tel=>request.parameters[:tel],
                               :sex=>request.parameters[:sex],
                               :city=>request.parameters[:city],
                               :region=>request.parameters[:region],
                               :community=>request.parameters[:community],
                               :house_number=>request.parameters[:house_number],
                               :lat=>request.parameters[:lat],
                               :lng=>request.parameters[:lng])
        @courier_address = CourierAddress.find(request.parameters[:id]);
        format.json { render json: {status: 200, courier_address: @courier_address }}
      else
        format.json { render json: {status: 400, message: "courier_address update successfully" }}
      end
    end
  end

  # POST delete_courier_address.json
  def delete_courier_address
    response.set_header("Access-Control-Allow-Origin", "*")
    respond_to do |format|
      @courier_address = CourierAddress.find(request.parameters[:id])
      if @courier_address.delete
        format.json { render json: {status: 200, message: "courier_address delete successfully" } }
      else
        format.json { render json: {status: 400, message: "courier_address delete unsuccessfully" }}
      end
    end
  end


end
