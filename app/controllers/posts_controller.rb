class PostsController < ApplicationController
  def index
    @page = params[:page].to_i
    if @page.nil?
      @page = 0
    end
    if params[:search].present?
      @posts = Post.where("title LIKE ?","%#{params["search"]}%").order(top: :desc)
    elsif params[:user_id].present?
      @posts = Post.where(poster_id: params[:user_id]).order(top: :desc)
    elsif params[:like].present?
      @likes = Like.where(user_id: params[:like]).pluck(:post_id)
      @posts = Post.where(:id => @likes).order(top: :desc)
    else
      @posts = Post.all.order(top: :desc)
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post.id).order('date')  
  end

  def create
  	@post = Post.create(forum_id: params[:forum_id].to_i,
                 title: params[:title],
                 content: params[:content],
                 level: params[:level].to_i,
                 date: Time.new.strftime("%Y-%m-%d %H:%M:%S"),
                 top: params[:top] == "true",
                 important: params[:important] == "true",
                 poster_id: session[:user_id])
    @user = User.find_by_id(session[:user_id])
    @level = @user.level
    @level = @level + 0.7/(@level+1)
    @user.update level: @level
    @user.save

    if @post.save
      redirect_to post_url(@post.id), notice: "Post Created."
    else
      redirect_to forum_url(params[:forum_id]), notice: "Post Failed."
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update title: params[:title],
                 level: params[:level].to_i,
                 content: params[:content],
                 date: Time.new.strftime("%Y-%m-%d %H:%M:%S"),
                 top: params[:top] == "true",
                 important: params[:important] == "true"

    redirect_to post_url(@post.id)
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @forum = @post.forum_id

    @post.destroy

    redirect_to forum_url(@forum)
  end


end