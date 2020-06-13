class UsersController < ApplicationController
  before_action :correct_user, except: :index

  def index
    @post_releases = Post.release_post
    @posts = @post_releases.where(group_id: current_user.groups.ids).limit(6)
    @users = User.search(params[:keyword], current_user.id)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :avater, :email, :introduce, :timetable)
  end

  def correct_user
    if request.referer.nil?
      redirect_to root_path
    end
  end
end
