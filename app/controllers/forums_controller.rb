class ForumsController < ApplicationController
	def index
    if params[:search].present?
      @forums = Forum.where("forum_name LIKE '%#{params["search"]}%'")
    elsif params[:user_id].present?
      @forums = Forum.where(admin_id: params[:user_id])
    elsif params[:watch].present?
      @watches = Watch.where(user_id: params[:watch]).pluck(:forum_id)
      @forums = Forum.where(:id => @watches)
    else
		  @forums = Forum.all
    end
	end

  def show
    @forum = Forum.find(params[:id])
    @posts = Post.where(forum_id: @forum.id).order('date DESC')
  end

  def new
    @forum = Forum.new
  end

  def create
  	@forum = Forum.create(forum_name: params[:forum_name],
                 description: params[:description],
                 admin_id: session[:user_id])

    if @forum.save
      redirect_to root_url, notice: "Forum Created."
    else
      render "new"
    end
  end

  def edit
    @forum = Forum.find(params[:id])
  end

  def update
    @forum = Forum.find(params[:id])
    @forum.update forum_name: params[:forum_name],
                 description: params[:description]

    redirect_to forum_url(@forum.id)
  end

  def destroy
    @forum = Forum.find_by_id(params[:id])

    @forum.destroy

    redirect_to root_url
  end


end