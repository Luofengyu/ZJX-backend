class ProductItemsController < ApplicationController
  before_action :set_product_item, only: [:show, :edit, :update, :destroy]

  # # GET /product_items
  # # GET /product_items.json
  # def index
  #   @product_items = ProductItem.all
  # end
  #
  # # GET /product_items/1
  # # GET /product_items/1.json
  # def show
  # end
  #
  # # GET /product_items/new
  # def new
  #   @product_item = ProductItem.new
  # end
  #
  # # GET /product_items/1/edit
  # def edit
  # end
  #
  # # POST /product_items
  # # POST /product_items.json
  # def create
  #   @product_item = ProductItem.new(product_item_params)
  #
  #   respond_to do |format|
  #     if @product_item.save
  #       format.html { redirect_to @product_item, notice: 'Product item was successfully created.' }
  #       format.json { render :show, status: :created, location: @product_item }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @product_item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  #
  # # PATCH/PUT /product_items/1
  # # PATCH/PUT /product_items/1.json
  # def update
  #   respond_to do |format|
  #     if @product_item.update(product_item_params)
  #       format.html { redirect_to @product_item, notice: 'Product item was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @product_item }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @product_item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /product_items/1
  # # DELETE /product_items/1.json
  # def destroy
  #   @product_item.destroy
  #   respond_to do |format|
  #     format.html { redirect_to product_items_url, notice: 'Product item was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end


  # GET get_product_items.json
  def get_product_items
    @product_items = ProductItem.all
    respond_to do |format|
      format.json{render json: @product_items}
    end
  end

  # POST create_product_items.json
  def create_product_items
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
    respond_to do |format|
       if ProductItem.update(request.parameters[:id],
                             :serial=>request.parameters[:serial],
                             :order_id=>request.parameters[:order_id],
                             :product_id=>request.parameters[:product_id],
                             :status=>request.parameters[:status])
         product_item = ProductItem.find(request.parameters[:id]);
         format.json { render json: {status: 200, product_item: product_item }}
       else
         format.json { render json: {status: 200, message: "productItems update successfully" }}
       end
    end
  end

  # POST delete_product_items.json
  def delete_product_items
    @product_item = ProductItem.find(request.parameters[:id])
    @product_item.delete()
    respond_to do |format|
      format.json { render json: {status: 200, message: "productItems delete successfully" } }
    end
  end



end
