class UsersController < ApplicationController
  #POST /users/register.json
  def register
    response.set_header("Access-Control-Allow-Origin", "*")
    @data = request.parameters
    @email = @data[:email]
    begin
      @temp_user = User.find_by_email(@email)
      if !@temp_user
        createUser(@data)
      else
        respond_to do |format|
          format.json{render json:{status:555, message: "exist"}}
          format.html{render json:{status:555, message: "exist"}}
        end
      end
    rescue
      respond_to do |format|
        format.json{render json:{status:555,req:@data}}
        format.html{render json:{status:555,req:@data}}
      end
    end
  end

  #POST /users/login.json
  def login
    response.set_header("Access-Control-Allow-Origin", "*")
    begin
      @data = request.parameters
      @email = @data[:email]
      @password = @data[:encrypted_password]
      @user = User.find_by_email(@email)
      if @user
        if @user[:encrypted_password] == @password
          respond_to do |format|
            format.json{render json:{status:200,data:@user}}
            format.html{render json:{status:200,data:@user}}
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

  def createUser(params)
    response.set_header("Access-Control-Allow-Origin", "*")
    @user = User.new
    @user.mobile = params[:mobile]
    @user.name = params[:name]
    @user.encrypted_password = params[:encrypted_password]
    @user.email = params[:email]
    if @user.save
      respond_to do |format|
        format.json{render json:{status:200,data:@user}}
        format.html{render json:{status:200,data:@user}}
      end
    else
      respond_to do |format|
        format.json{render json:{status:555, message:"fail", data:@user}}
        format.html{render json:{status:555, message:"fail", data:@user}}
      end
    end
  end

  # POST update_user.json
  def update_user
    response.set_header("Access-Control-Allow-Origin", "*")
    respond_to do |format|
      if User.update(request.parameters[:id],
                        :mobile=>request.parameters[:mobile],
                        :email=>request.parameters[:email],
                        :encrypted_password=>request.parameters[:encrypted_password],
                        :name=>request.parameters[:name])
        @user = User.find(request.parameters[:id]);
        format.json { render json: {status: 200, data:@user }}
      else
        format.json { render json: {status: 200, message: "update successfully" }}
      end
    end
  end

  # POST delete_user.json
  def delete_user
    response.set_header("Access-Control-Allow-Origin", "*")
    @user = User.find(request.parameters[:id])
    if @user.delete
      respond_to do |format|
        format.json { render json: {status: 200, message: "delete successfully" } }
      end
    end
  end

  # GET index
  def index
    response.set_header("Access-Control-Allow-Origin", "*")
    @user_list = User.all
    respond_to do |format|
      format.html { render json: {status: 200, data:@user_list } }
      format.json { render json: {status: 200, data:@user_list } }
    end
  end

end
