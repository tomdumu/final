class FollowsController < ActionController::Base
  def create
    @follow = Follow.create(follower_id: session[:user_id], leader_id: params[:id])
    @url = params[:url]
  	if @follow.save
  	  redirect_to @url, notice: "Follow Successed!"
  	else
  	  redirect_to @url, notice: "Follow Failed!"
  	end
  end
  def destroy
  	@follow = Follow.find_by(follower_id: session[:user_id], leader_id: params[:id])
  	@follow.destroy
    @url = params[:url]
  	redirect_to @url, notice: "Unfollow Successed!"
  end
end