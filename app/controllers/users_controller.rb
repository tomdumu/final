class UsersController < ApplicationController
  def index
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
      level: 0.0, 
      birthday: params[:date].to_date,
      real_name: params[:real_name], 
      address: params[:address], 
      email: params[:email], 
      gender: params[:gender])

    if @user.save
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
    @pw1 = params[:pw1]
    @pw2 = params[:pw2]
    if @pw1.nil? || @pw2.nil? || @pw1.length < 1 || @pw2.length < 1
      redirect_to user_url(@user.id), notice: "Failed! Invalid password"
    elsif @pw1 != @pw2
      redirect_to user_url(@user.id), notice: "Failed! Re-enter password not match"      
    else
    @user.update real_name: params[:real_name],
    address: params[:address],
    email: params[:email],
    password: params[:pw1],
    birthday: params[:birthday].to_date

    redirect_to user_url(@user.id), notice: "Change successfully"
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])

    @user.destroy

    redirect_to signout_url
  end
end