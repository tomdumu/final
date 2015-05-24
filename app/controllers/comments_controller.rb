class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end

  def create
    if (Post.find_by_id(params[:post_id]).level.present?)&&(User.find_by_id(session[:user_id]).level.to_i < Post.find_by_id(params[:post_id]).level)

      redirect_to post_url(params[:post_id]), notice: "Comment Failed! Your level is too low to comment this post!"
    
    else
  	@comment = Comment.new(post_id: params[:post_id].to_i,
                 date: Time.new.strftime("%Y-%m-%d %H:%M:%S"),
                 content: params[:content],
                 commenter_id: session[:user_id])
    @user = User.find_by_id(@comment.commenter_id)
    @post = Post.find_by_id(@comment.post_id)
    @poster = User.find_by_id(@post.poster_id)
    @level = @user.level
    if @level <= 15 && @comment.commenter_id != @poster.id
      @level = @level + 0.5/(@level+1)
      @user.update level: @level
      @user.save
    end
    @level1 = @poster.level
    if @level1 <= 15 && @comment.commenter_id != @poster.id
      @level1 = @level1 + 0.9/(@level1+1)
      @poster.update level: @level1
      @poster.save
    end

    if @comment.save
      redirect_to post_url(@comment.post_id), notice: "Comment Successed!"
    else
      redirect_to post_url(params[:post_id]), notice: "Comment Failed."
    end
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