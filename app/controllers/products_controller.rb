class ProductsController < ApplicationController

# GET get_products.json
  def get_products
    response.set_header("Access-Control-Allow-Origin", "*")
    category_id = request.parameters[:category_id]
    sql = "select products.*,prices.price1 from products inner join prices
             on products.id = prices.product_id and products.category_id = "
    sql.concat(category_id)
    products=Product.connection.select_all(sql)
    respond_to do |format|
      format.json{ render json: {status:200,product:products} }
    end
  end

  # GET get_qiye_products.json
  def get_qiye_products
    response.set_header("Access-Control-Allow-Origin", "*")
    sql = "select products.*,prices.price1 from products inner join prices
             on products.id = prices.product_id"
    products=Product.connection.select_all(sql)
    respond_to do |format|
      format.json{ render json: {status:200,product:products} }
    end
  end


# POST create_products.json
  def create_products
    response.set_header("Access-Control-Allow-Origin", "*")
    @product = Product.new()
    @product.name=request.parameters[:name]
    @product.logo=request.parameters[:logo]
    @product.is_del=request.parameters[:is_del]
    @product.category_id=request.parameters[:category_id]
    respond_to do |format|
      if  @product.save
        @price = Price.new()
        @price.product_id = @product.id
        @price.price1 = request.parameters[:price1]
        @price.save
        sql = "select products.*,prices.price1 from products inner join prices
             on products.id = prices.product_id and products.id = "
        sql.concat(@price.product_id)
        products=Product.connection.select_all(sql)
        format.json { render json: {status: 200, products: products }}
      else
        format.json { render json: {status: 400, message: "products created unsuccessfully" }}
      end
    end
  end

# POST update_products.json
  def update_products
    response.set_header("Access-Control-Allow-Origin", "*")
    respond_to do |format|
      if Product.update(request.parameters[:id],
                            :name=>request.parameters[:name],
                            :logo=>request.parameters[:logo],
                            :is_del=>request.parameters[:is_del],
                            :category_id=>request.parameters[:category_id])
        price = Price.find_by_product_id(request.parameters[:id]);
        price.update_attributes(:price1=>request.parameters[:price1])
        sql = "select products.*,prices.price1 from products inner join prices
             on products.id = prices.product_id and products.id = "
        sql.concat(request.parameters[:id])
        products=Product.connection.select_all(sql)
        format.json { render json: {status: 200, products: products }}
      else
        format.json { render json: {status: 200, message: "products update successfully" }}
      end
    end
  end

# POST delete_products.json
  def delete_products
    response.set_header("Access-Control-Allow-Origin", "*")
    @product = Product.find(request.parameters[:id])
    @product.update_attribute(:is_del,1)
    respond_to do |format|
      format.json { render json: {status: 200, message: "product delete successfully" } }
    end
  end
end
