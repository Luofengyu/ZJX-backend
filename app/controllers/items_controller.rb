class ItemsController < ApplicationController

  # GET get_items.json
  def get_items
    response.set_header("Access-Control-Allow-Origin", "*")
    @order_id = request.parameters[:order_id]
    sql = "select items.*,products.name from items inner join products
           on items.product_id = products.id and order_id= "
    sql.concat(@order_id)
    @items = Item.connection.select_all(sql)
    respond_to do |format|
      format.json{render json: {status: 200,items: @items}}
    end
  end

end