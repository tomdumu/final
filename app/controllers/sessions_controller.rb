class SessionsController < ApplicationController
  def create
    if(session[:user_id].present?)
      redirect_to "#", notice: "You've already signed in!"
    end
    user = User.find_by(user_name: params[:user_name])
    if user
      if user.authenticate(params[:password])
      #if user.password == params[:password]
        #cookies["user_id"] = user.id
        session[:user_id] = user.id
        redirect_to root_url, notice: "Welcome back!"
      else
        redirect_to root_url, notice: "Unknown password."
      end
    else
      redirect_to root_url, notice: "Unknown User Name."
    end
  end

  def destroy
    #cookies.delete("user_id")
    session[:user_id] = nil
    redirect_to root_url, notice: "You've signed out."
  end
end