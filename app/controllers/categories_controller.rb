class CategoriesController < ApplicationController
  
  before_action :set_category, only: [:show, :edit, :update, :destroy, :prices, :init_prices]

  # GET get_categories.json
  def get_categories
    @categories = Category.all
    respond_to do |format|
      format.json{render json: @categories}
    end
  end

  # GET get_categories_items.json
  def get_categories_items
    @categories = Category.find(request.parameters[:id])
    respond_to do |format|
      format.json{render json: @categories}
    end
  end

  # POST create_categories.json
  def create_categories
    @categories = Category.new()
    @categories.name = request.parameters[:name]
    @categories.logo = request.parameters[:logo]
    @categories.is_del = request.parameters[:is_del]
    respond_to do |format|
      if @categories.save
        format.json { render json: {status: 200, categories: @categories }}
      else
        format.json { render json: {status: 400, message: "categories created unsuccessfully" }}
      end
    end
  end

  # POST update_categories.json
  def update_categories
    respond_to do |format|
      if Category.update(request.parameters[:id],
                            :name=>request.parameters[:name],
                            :logo=>request.parameters[:logo],
                            :is_del=>request.parameters[:is_del])
        @categories = Category.find(request.parameters[:id]);
        format.json { render json: {status: 200, categories: @categories }}
      else
        format.json { render json: {status: 200, message: "categories update successfully" }}
      end
    end
  end

  # POST delete_categories.json
  def delete_categories
    @categories = Category.find(request.parameters[:id])
    @categories.update_attribute(:is_del,1)
    respond_to do |format|
      format.json { render json: {status: 200, message: "categories delete successfully" } }
    end
  end
  end
