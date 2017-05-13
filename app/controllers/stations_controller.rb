class StationsController < ApplicationController

  # GET get_station.json
  def get_station
    response.set_header("Access-Control-Allow-Origin", "*")
    @station = StationAddress.all
    respond_to do |format|
      format.json{render json: {status: 200,station: @station}}
    end
  end

  # GET get_station_address.json
  def get_station_address
    response.set_header("Access-Control-Allow-Origin", "*")
    @station_address = StationAddress.find(request.parameters[:id])
    respond_to do |format|
      format.json{render json: {status: 200, station_address: @station_address}}
    end
  end

  # POST create_station_address.json
  def create_station_address
    response.set_header("Access-Control-Allow-Origin", "*")
    @station_address = StationAddress.new()
    @station_address.name = request.parameters[:name]
    @station_address.tel = request.parameters[:tel]
    @station_address.sex = request.parameters[:sex]
    @station_address.city = request.parameters[:city]
    @station_address.region = request.parameters[:region]
    @station_address.community = request.parameters[:community]
    @station_address.house_number = request.parameters[:house_number]
    @station_address.lat = request.parameters[:lat]
    @station_address.lng = request.parameters[:lng]
    respond_to do |format|
      if @station_address.save
        format.json { render json: {status: 200, station_address: @station_address }}
      else
        format.json { render json: {status: 400, message: "station_address created unsuccessfully" }}
      end
    end
  end

  # POST update_station_address.json
  def update_station_address
    response.set_header("Access-Control-Allow-Origin", "*")
    respond_to do |format|
      if StationAddress.update(request.parameters[:id],
                               :name=>request.parameters[:name],
                               :tel=>request.parameters[:tel],
                               :sex=>request.parameters[:sex],
                               :city=>request.parameters[:city],
                               :region=>request.parameters[:region],
                               :community=>request.parameters[:community],
                               :house_number=>request.parameters[:house_number],
                               :lat=>request.parameters[:lat],
                               :lng=>request.parameters[:lng])
        @station_address = StationAddress.find(request.parameters[:id]);
        format.json { render json: {status: 200, station_address: @station_address }}
      else
        format.json { render json: {status: 400, message: "station_address update successfully" }}
      end
    end
  end

  # POST delete_station_address.json
  def delete_station_address
    response.set_header("Access-Control-Allow-Origin", "*")
    respond_to do |format|
      @station_address = StationAddress.find(request.parameters[:id])
      if @station_address.delete
        format.json { render json: {status: 200, message: "station_address delete successfully" } }
      else
        format.json { render json: {status: 400, message: "station_address delete unsuccessfully" }}
      end
    end
  end

end
