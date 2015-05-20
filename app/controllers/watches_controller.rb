class WatchesController < ActionController::Base
  def index
  	@watches = Watch.find_by(user_id: params[:user_id])
  end
  def create
  	@watch = Watch.create(user_id: session[:user_id], forum_id: params[:forum_id])
  	if @watch.save
  	  redirect_to root_url, notice: "Watch Successed!"
  	else
  	  redirect_to root_url, notice: "Watch Failed!"
  	end
  end
  def destroy
  	@watch = Watch.find_by(user_id: params[:user_id], forum_id: params[:forum_id])
  	@watch.destroy
  	redirect_to root_url, notice: "Unwatched!"
  end
end