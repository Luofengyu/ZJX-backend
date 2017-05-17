class RolesController < ApplicationController
  
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  # GET get_roles.json
  def get_roles
    response.set_header("Access-Control-Allow-Origin", "*")
    @roles = Role.all
    respond_to do |format|
      format.json{ render json: {status:200 ,roles:@roles} }
    end
  end

  # GET get_roles_items.json
  def get_roles_items
    response.set_header("Access-Control-Allow-Origin", "*")
    @roles = Role.find(request.parameters[:id])
    respond_to do |format|
      format.json{render json: {status:200 ,roles:@roles}}
    end
  end

  # POST create_roles.json
  def create_roles
    response.set_header("Access-Control-Allow-Origin", "*")
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
    response.set_header("Access-Control-Allow-Origin", "*")
    respond_to do |format|
      if Role.update(request.parameters[:id],
                            :name=>request.parameters[:name],
                            :resource_id=>request.parameters[:resource_id],
                            :resource_type=>request.parameters[:resource_type],
                            :display_name=>request.parameters[:display_name],
                            :comment=>request.parameters[:comment])
        @roles = Role.find(request.parameters[:id])
        format.json { render json: {status: 200, roles: @roles }}
      else
        format.json { render json: {status: 400, message: "roles update unsuccessfully" }}
      end
    end
  end

  # POST delete_roles.json
  def delete_roles
    response.set_header("Access-Control-Allow-Origin", "*")
    @roles = Role.find(request.parameters[:id])
    @roles.delete()
    respond_to do |format|
      format.json { render json: {status: 200, message: "roles delete successfully" } }
    end
  end

  #post assign_worker_role.json
  def assign_worker_role
    response.set_header("Access-Control-Allow-Origin", "*")
    @role = Role.find(request.parameters[:role_id])
    @worker = Role.find(request.parameters[:worker_id])
    @worker_role = WorkerRole.new
    @worker_role.role_id = request.parameters[:role_id]
    @worker_role.worker_id = request.parameters[:worker_id]
    @worker_role.save
    respond_to do |format|
      format.json { render json: {status: 200, role:@role, worker:@worker } }
    end
  end
end
