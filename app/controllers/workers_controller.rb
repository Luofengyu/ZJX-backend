class WorkersController < ApplicationController


  #POST /workers/register.json
  def register
    response.set_header("Access-Control-Allow-Origin", "*")
    @data = request.parameters
    @email = @data[:email]
    # begin
      @temp_worker = Worker.find_by_email(@email)
      if !@temp_worker
        createWorker(@data)
      else
        respond_to do |format|
          format.json{render json:{status:555, message: "exist"}}
          format.html{render json:{status:555, message: "exist"}}
        end
      end
    # rescue
    #   respond_to do |format|
    #     format.json{render json:{status:555,req:@data}}
    #     format.html{render json:{status:555,req:@data}}
    #   end
    # end
  end

  #POST /workers/login.json
  def login
    response.set_header("Access-Control-Allow-Origin", "*")
    begin
      @data = request.parameters
      @email = @data[:email]
      @password = @data[:encrypted_password]
      @worker = Worker.find_by_email(@email)
      if @worker
        if @worker[:encrypted_password] == @password
          respond_to do |format|
            format.json{render json:{status:200,data:@worker}}
            format.html{render json:{status:200,data:@worker}}
          end
        else
          respond_to do |format|
            format.json{render json:{status:555, message:"wrong"}}
            format.html{render json:{status:555, message:"wrong"}}
          end
        end
      else
        respond_to do |format|
          format.json{render json:{status:555, message:"null"}}
          format.html{render json:{status:555, message:"null"}}
        end
      end
    rescue
      respond_to do |format|
        format.json{render json:{status:555}}
        format.html{render json:{status:555}}
      end
    end
  end

  def createWorker(params)
    print(params)
    response.set_header("Access-Control-Allow-Origin", "*")
    @worker = Worker.new
    @worker.email = params[:email]
    @worker.password = params[:encrypted_password]
    if @worker.save!
      respond_to do |format|
        format.json{render json:{status:200,data:@worker}}
        format.html{render json:{status:200,data:@worker}}
      end
    else
      respond_to do |format|
        format.json{render json:{status:555, message:"fail", data:@worker}}
        format.html{render json:{status:555, message:"fail", data:@worker}}
      end
    end
  end

  # POST update_worker.json
  def update_worker
    response.set_header("Access-Control-Allow-Origin", "*")
    respond_to do |format|
      if Worker.update(request.parameters[:id],
                     :email=>request.parameters[:email],
                     :encrypted_password=>request.parameters[:encrypted_password])
        @worker = Worker.find(request.parameters[:id]);
        format.json { render json: {status: 200, data:@worker }}
      else
        format.json { render json: {status: 200, message: "update successfully" }}
      end
    end
  end

  # POST delete_worker.json
  def delete_worker
    response.set_header("Access-Control-Allow-Origin", "*")
    @worker = Worker.find(request.parameters[:id])
    if @worker.delete
      respond_to do |format|
        format.json { render json: {status: 200, message: "delete successfully" } }
      end
    end
  end

  # GET get_all_workers
  def get_all_workers
    response.set_header("Access-Control-Allow-Origin", "*")
    @worker_list = Worker.all
    @data = []
    for @worker in @worker_list
      @sql = "select * from worker_roles  where id=" + String(@worker["id"])
      @role_list = WorkerRole.connection.select_all(@sql)
      if @role_list
        @worker_role = []
        for @role in @role_list
          @role_Obj = Role.find(@role["role_id"])
          @worker_role.push(@role_Obj)
        end
        @data.push({"worker":@worker, "roles":@worker_role})
      else
        @data.push({"worker":@worker, "roles":[]})
      end

    end
    respond_to do |format|
      format.html { render json: {status: 200, data:@data } }
      format.json { render json: {status: 200, data:@data } }
    end
  end


end
