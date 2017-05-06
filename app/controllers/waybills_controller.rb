class WaybillsController < ApplicationController

  # GET /get_waybills.json
  def get_waybills
    response.set_header("Access-Control-Allow-Origin", "*")
    @order_id = request.parameters[:order_id]
    sql = "select waybills.* from waybills where order_id="
    sql.concat(@order_id)
    @waybills = Waybill.connection.select_all(sql)
    respond_to do |format|
      format.json{render json: {status: 200,waybills: @waybills}}
    end
  end
end