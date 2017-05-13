class ProductItemsController < ApplicationController

  # GET get_product_items.json
  def get_product_items
    response.set_header("Access-Control-Allow-Origin", "*")
    @product_items = ProductItem.all
    respond_to do |format|
      format.json{render json: {status:200, product_item: @product_items}}
    end
  end

  # POST create_product_items.json
  def create_product_items
    response.set_header("Access-Control-Allow-Origin", "*")
    @product_item = ProductItem.new()
    @product_item.serial = request.parameters[:serial]
    @product_item.order_id = request.parameters[:order_id]
    @product_item.product_id = request.parameters[:product_id]
    @product_item.status = request.parameters[:status]
    respond_to do |format|
      if @product_item.save
        format.json { render json: {status: 200, product_item: @product_item }}
      else
        format.json { render json: {status: 400, message: "productItems created unsuccessfully" }}
      end
    end
  end

  # POST update_product_items.json
  def update_product_items
    response.set_header("Access-Control-Allow-Origin", "*")
    respond_to do |format|
       if ProductItem.update(request.parameters[:id],
                             :serial=>request.parameters[:serial],
                             :order_id=>request.parameters[:order_id],
                             :product_id=>request.parameters[:product_id],
                             :status=>request.parameters[:status])
         product_item = ProductItem.find(request.parameters[:id]);
         format.json { render json: {status: 200, product_item: product_item }}
       else
         format.json { render json: {status: 400, message: "productItems update unsuccessfully" }}
       end
    end
  end

  # POST delete_product_items.json
  def delete_product_items
    response.set_header("Access-Control-Allow-Origin", "*")
    @product_item = ProductItem.find(request.parameters[:id])
    @product_item.delete()
    respond_to do |format|
      format.json { render json: {status: 200, message: "productItems delete successfully" } }
    end
  end



end
