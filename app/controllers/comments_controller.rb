class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end

  def create
  	@comment = Comment.new(post_id: params[:post_id].to_i,
                 date: Time.new.strftime("%Y-%m-%d %H:%M:%S"),
                 content: params[:content],
                 commenter_id: session[:user_id])

    if @comment.save
      redirect_to post_url(@comment.post_id), notice: "Comment Successed!"
    else
      redirect_to post_url(params[:post_id]), notice: "Comment Failed."
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update content: params[:content]

    redirect_to post_url(@comment.post_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find_by_id(@comment.post_id)
    @comment.delete

    redirect_to post_url(@post.id)
  end


end