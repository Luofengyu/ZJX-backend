class StationsController < ApplicationController
  # before_action :set_station, only: [:show, :edit, :update, :destroy]
  #
  # # GET /stations
  # # GET /stations.json
  # def index
  #   @stations = Station.all
  # end
  #
  # # GET /stations/1
  # # GET /stations/1.json
  # def show
  # end
  #
  # # GET /stations/new
  # def new
  #   @station = Station.new
  #   @station.build_address
  # end
  #
  # # GET /stations/1/edit
  # def edit
  # end
  #
  # # POST /stations
  # # POST /stations.json
  # def create
  #   @station = Station.new(station_params)
  #
  #   respond_to do |format|
  #     if @station.save
  #       format.html { redirect_to @station, notice: 'Station was successfully created.' }
  #       format.json { render :show, status: :created, location: @station }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @station.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # PATCH/PUT /stations/1
  # # PATCH/PUT /stations/1.json
  # def update
  #   respond_to do |format|
  #     if @station.update(station_params)
  #       format.html { redirect_to @station, notice: 'Station was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @station }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @station.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /stations/1
  # # DELETE /stations/1.json
  # def destroy
  #   @station.destroy
  #   respond_to do |format|
  #     format.html { redirect_to stations_url, notice: 'Station was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
  #
  # def suggestion
  #   url = 'http://api.map.baidu.com/place/v2/suggestion'
  #   resp = RestClient.get url, {params: {region: '全国', output: 'json', ak: '9c0105d4f31da574429c49cca95c5566', query: params[:term]}}
  #
  #   result = JSON.parse(resp)['result'].map do |result|
  #     city = Region.find_by_name_and_level(result['city'], 2)
  #     area = city.children.find_by_name(result['district'])
  #     {id: result['name'], text: result['name'], lat: result['location']['lat'], lng: result['location']['lng'], region_id: area.id}
  #   end
  #
  #   render json: {results: result}
  # end
  #
  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_station
  #     @station = Station.find(params[:id])
  #   end
  #
  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def station_params
  #     ret = params.require(:station).permit(:name, :region_id, address_attributes: [:id, :address, :comment, :lat, :lng])
  #     ret[:address_attributes].delete(:address) if ret[:address_attributes][:address].blank?
  #     ret
  #   end

  ###############################################################fenge

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
