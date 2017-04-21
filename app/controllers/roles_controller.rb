class RolesController < ApplicationController
  
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  # GET get_roles.json
  def get_roles
    @roles = Role.all
    respond_to do |format|
      format.json{ render json: @roles }
    end
  end

  # GET get_roles_items.json
  def get_roles_items
    @roles = Role.find(request.parameters[:id])
    respond_to do |format|
      format.json{render json: @roles}
    end
  end

  # POST create_roles.json
  def create_roles
    @roles = Role.new()
    @roles.name=request.parameters[:name]
    @roles.resource_id=request.parameters[:resource_id]
    @roles.resource_type=request.parameters[:resource_type]
    @roles.display_name=request.parameters[:display_name]
    @roles.comment=request.parameters[:comment]
    respond_to do |format|
      if @roles.save
        format.json { render json: {status: 200, roles: @roles }}
      else
        format.json { render json: {status: 400, message: "roles created unsuccessfully" }}
      end
    end
  end

  # POST update_roles.json
  def update_roles
    respond_to do |format|
      if Role.update(request.parameters[:id],
                            :name=>request.parameters[:name],
                            :resource_id=>request.parameters[:resource_id],
                            :resource_type=>request.parameters[:resource_type],
                            :display_name=>request.parameters[:display_name],
                            :comment=>request.parameters[:comment])
        @roles = Role.find(request.parameters[:id]);
        format.json { render json: {status: 200, roles: @roles }}
      else
        format.json { render json: {status: 200, message: "roles update successfully" }}
      end
    end
  end

  # POST delete_roles.json
  def delete_roles
    @roles = Role.find(request.parameters[:id])
    @roles.delete()
    respond_to do |format|
      format.json { render json: {status: 200, message: "roles delete successfully" } }
    end
  end
end
