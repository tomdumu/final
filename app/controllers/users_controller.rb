class UsersController < ApplicationController

  def index
    @page = params[:page].to_i
    if @page.nil?
      @page = 0
    end
    if params[:search].present?
      @users = User.where("user_name LIKE '%#{params["search"]}%'")
    elsif params[:follow].present?
      @leaders = Follow.where(follower_id: params[:follow]).pluck(:leader_id)
      @users = User.where(:id => @leaders)
    elsif params[:leader].present?
      @followers = Follow.where(leader_id: params[:leader]).pluck(:follower_id)
      @users = User.where(:id => @followers)
    else
      @users = User.all
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_name: params[:user_name], 
      password: params[:password], 
      birthday: params[:date].to_date,
      real_name: params[:real_name], 
      address: params[:address], 
      email: params[:email], 
      gender: params[:gender],
      avatar: params[:avatar])

    if @user.save
      @level = Level.new(user_id: @user.id, level: 0.0)
      @level.save
      redirect_to root_url, notice: "Thanks for signing up!"
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def editpw
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @updatepw = params[:updatepw]
    @pw1 = params[:pw1]
    @pw2 = params[:pw2]
    @pw = params[:password]
    @old = params[:old]
    if @updatepw == "false"
      if @user.authenticate(params[:password])
      @user.real_name = params[:real_name]
      @user.address = params[:address]
      @user.email = params[:email]
      @user.birthday = params[:birthday].to_date
      @user.avatar = params[:avatar]
      @user.password = params[:password]
      @user.save
      redirect_to user_url(@user.id), notice: "Change profile successfully"
      else
        redirect_to user_url(@user.id), notice: "Failed! Wrong password!"
      end
    elsif @pw1.nil? || @pw2.nil? || @old.nil?
      redirect_to user_url(@user.id), notice: "Failed! Please do not leave any input blank"  
    elsif @pw1 != @pw2
      redirect_to user_url(@user.id), notice: "Failed! Re-enter password not match"  
    elsif !@user.authenticate(@old)
      redirect_to user_url(@user.id), notice: "Failed! Old password is wrong"     
    else
      @user.password = params[:pw1]
      @user.save
      redirect_to user_url(@user.id), notice: "Change password successfully"
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @x = Level.find_by(user_id: @user.id)
    @x.delete

    @user.destroy

    redirect_to signout_url
  end
end