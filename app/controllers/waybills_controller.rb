class WaybillsController < ApplicationController

  # GET /get_waybills.json
  def get_waybills
    response.set_header("Access-Control-Allow-Origin", "*")
    @order_id = request.parameters[:order_id]
    sql = "select waybills.* from waybills where order_id="
    sql.concat(@order_id)
    sql.concat(" order by waybills.id desc")
    @waybills = Waybill.connection.select_all(sql)
    respond_to do |format|
      format.json{render json: {status: 200,waybills: @waybills}}
    end
  end


  # POST image_upload.json
  def image_upload
    response.set_header("Access-Control-Allow-Origin", "*")
    logo = request.parameters[:logo]
    puts "aaa"
    if logo
      filename = generate_filename
      put("aaa")
      Image.upload(logo.tempfile.path, filename)
    end
    # url = generate_filename

    # puts url
    respond_to do |format|
      format.json{render json: {status: 200}}
    end
  end

  def generate_filename
    "zjx-#{Time.now.to_i * 1000 + rand(1000)}"
  end

  def generate_url(filename)
    "http://olavg5ba4.bkt.clouddn.com/" + filename
  end


end