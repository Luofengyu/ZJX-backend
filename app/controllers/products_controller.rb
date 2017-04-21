class ProductsController < ApplicationController

# GET get_products.json
  def get_products
    sql = "select * from products where category_id = " + request.parameters[:category_id]
    @products = Product.connection.select_all(sql)
    respond_to do |format|
      format.json{render json: @products}
    end
  end

# POST create_products.json
  def create_products
    @product = Product.new()
    @product.name=request.parameters[:name]
    @product.logo=request.parameters[:logo]
    @product.is_del=request.parameters[:is_del]
    @product.category_id=request.parameters[:category_id]
    respond_to do |format|
      if @product.save
        format.json { render json: {status: 200, product: @product }}
      else
        format.json { render json: {status: 400, message: "products created unsuccessfully" }}
      end
    end
  end

# POST update_products.json
  def update_products
    respond_to do |format|
      if Product.update(request.parameters[:id],
                            :name=>request.parameters[:name],
                            :logo=>request.parameters[:logo],
                            :is_del=>request.parameters[:is_del],
                            :category_id=>request.parameters[:category_id])
        product = Product.find(request.parameters[:id]);
        format.json { render json: {status: 200, product: product }}
      else
        format.json { render json: {status: 200, message: "products update successfully" }}
      end
    end
  end

# POST delete_products.json
  def delete_products
    @product = Product.find(request.parameters[:id])
    @product.update_attribute(:is_del,1)
    respond_to do |format|
      format.json { render json: {status: 200, message: "product delete successfully" } }
    end
  end
end
