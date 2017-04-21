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

  # GET index
  def index
    response.set_header("Access-Control-Allow-Origin", "*")
    @worker_list = Worker.all
    respond_to do |format|
      format.html { render json: {status: 200, data:@worker_list } }
      format.json { render json: {status: 200, data:@worker_list } }
    end
  end

  # load_and_authorize_resource
  # 
  # before_action :set_worker, only: [:show, :edit, :update, :destroy]
  # 
  # def index
  #   @workers = Worker.paginate(page: params[:page], per_page: 10).order(updated_at: :desc)
  # end
  # 
  # # GET /workers/1
  # # GET /workers/1.json
  # def show
  # end
  # 
  # # GET /workers/new
  # def new
  #   @worker = Worker.new
  # end
  # 
  # def create
  #   @worker = Worker.new(worker_params)
  # 
  #   respond_to do |format|
  #     if @worker.save
  #       format.html { redirect_to workers_path, notice: 'Worker was successfully created.' }
  #       format.json { render :show, status: :created, location: @worker }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @worker.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # GET /workers/1/edit
  # def edit
  # end
  # 
  # def reset_password
  # end
  # 
  # # PATCH/PUT /workers/1
  # # PATCH/PUT /workers/1.json
  # def update
  #   respond_to do |format|
  #     if @worker.update(worker_params)
  #       format.html { redirect_to workers_path, notice: 'Worker was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @worker }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @worker.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # # DELETE /workers/1
  # # DELETE /workers/1.json
  # def destroy
  #   @worker.destroy
  #   respond_to do |format|
  #     format.html { redirect_to :back, notice: 'Worker was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
  # 
  # def change_current_city
  #   session[:current_city_id] = params[:id]
  #   redirect_to :back
  # end
  # 
  # private
  #   def set_outlet
  #     @outlet = Outlet.find(params[:outlet_id])
  #   end
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_worker
  #     @worker = Worker.find(params[:id])
  #   end
  # 
  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def worker_params
  #     params.require(:worker).permit(:email, :password, :password_confirmation, role_ids: [], city_ids: [])
  #   end
  
end
