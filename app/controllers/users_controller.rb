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

  # GET get_item.json
  def get_item
    response.set_header("Access-Control-Allow-Origin", "*")
    @user_id = request.parameters[:user_id]
    sql1 = "select users.*,user_cards.* from users inner join user_cards
           on user_cards.user_id = users.id and user_id= "
    sql1.concat(@user_id)
    @items = Item.connection.select_all(sql1)
    sql2 = "select * from user_card_logs where user_id = "
    sql2.concat(@user_id)
    @logs = Item.connection.select_all(sql2)
    respond_to do |format|
      format.json{render json: {status: 200,items: @items,logs:@logs}}
    end
  end

  #POST direct_charge.json
  def direct_charge
    response.set_header("Access-Control-Allow-Origin", "*")
    @user_id = request.parameters[:user_id]
    @real_money = request.parameters[:real_money]
    @fake_money = request.parameters[:fake_money]
    @user_card = UserCard.find_by_user_id(@user_id)
    real_money = @real_money.to_f + @user_card[:real_money].to_f
    puts (real_money)
    fake_money = @fake_money.to_f + @user_card[:fake_money].to_f
    UserCard.update(@user_card[:id],
                    :real_money=>real_money,
                    :fake_money=>fake_money)
    @user_card_log = UserCardLog.new
    @user_card_log.real_money = @real_money
    @user_card_log.fake_money = @fake_money
    @user_card_log.user_id = @user_id
    @user_card_log.kind = 0
    @user_card_log.loggable_type = "用户充值"
    @user_card_log.loggable_id = 0
    if @user_card_log.save
      respond_to do |format|
        format.json{render json: {status: 200,log: @user_card_log}}
      end
    end
  end

  # GET wallet.json
  def wallet
    response.set_header("Access-Control-Allow-Origin", "*")
    @user_id = request.parameters[:user_id]
    sql1 = "select (user_cards.real_money+user_cards.fake_money) as money
             from user_cards where user_id= "
    sql1.concat(@user_id)
    @wallet = Item.connection.select_all(sql1)
    sql2 = "select * from user_card_logs where user_id = "
    sql2.concat(@user_id)
    @logs = Item.connection.select_all(sql2)
    respond_to do |format|
      format.json{render json: {status: 200,wallet: @wallet,logs:@logs}}
    end
  end

end
