class WatchesController < ActionController::Base
  def create
    @watch = Watch.create(user_id: session[:user_id], forum_id: params[:id])
    @url = params[:url]
  	if @watch.save
  	  redirect_to @url, notice: "Watch Successed!"
  	else
  	  redirect_to @url, notice: "Watch Failed!"
  	end
  end
  def destroy
  	@watch = Watch.find_by(user_id: session[:user_id], forum_id: params[:id])
  	@watch.destroy
    @url = params[:url]
  	redirect_to @url, notice: "Unwatched!"
  end
end