class LikesController < ActionController::Base
  def create
    @like = Like.create(user_id: session[:user_id], post_id: params[:id])
    @url = params[:url]
  	if @like.save
  	  redirect_to @url, notice: "Like Successed!"
  	else
  	  redirect_to @url, notice: "Like Failed!"
  	end
  end
  def destroy
  	@like = Like.find_by(user_id: session[:user_id], post_id: params[:id])
  	@like.destroy
    @url = params[:url]
  	redirect_to @url, notice: "Unlike Successed!"
  end
end