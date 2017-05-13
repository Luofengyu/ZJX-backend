class RegionsController < ApplicationController

  # GET get_cities.json
  def get_cities
    response.set_header("Access-Control-Allow-Origin", "*")
    @region = Region.where(:level => 2 ).all
    respond_to do |format|
      format.json{render json: {status: 200,region: @region}}
    end
  end

  # GET get_regions.json
  def get_regions
    response.set_header("Access-Control-Allow-Origin", "*")
    @region = Region.where([ "parent_id = ? ",request.parameters[:id] ] ).all
    respond_to do |format|
      format.json{render json: {status: 200,region: @region}}
    end
  end
end
