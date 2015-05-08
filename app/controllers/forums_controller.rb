class ForumsController < ApplicationController
	def index
		@forums = Forum.all
	end

  def show
    @forum = Forum.find(params[:id])
  end

  def new
  end

  def create
  	Forum.create forum_name: params[:forum_name],
                 description: params[:description],
                 admin_user: params[:admin_user]

    redirect_to root_url
  end

  def edit
    @forum = Forum.find(params[:id])
  end

  def update
    @forum = Forum.find(params[:id])
    @forum.update forum_name: params[:forum_name],
                 description: params[:description],
                 admin_user: params[:admin_user]

    redirect_to forum_url(@forum.id)
  end

  def destroy
    Forum.delete(params[:id])
    redirect_to root_url
  end


end