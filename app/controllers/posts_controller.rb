class PostsController < ApplicationController
  def index
    if params[:search].present?
      @posts = Post.where("title LIKE '%#{params["search"]}%'")
    elsif params[:user_id].present?
      @posts = Post.where(poster_id: params[:user_id])
    elsif params[:like].present?
      @likes = Like.where(user_id: params[:like]).pluck(:post_id)
      @posts = Post.where(:id => @likes)
    else
      @posts = Post.all
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
                 date: Time.new.strftime("%Y-%m-%d %H:%M:%S"),
                 top: params[:top] == "true",
                 important: params[:important] == "true",
                 poster_id: session[:user_id])

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