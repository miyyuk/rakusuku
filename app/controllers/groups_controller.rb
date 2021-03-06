class GroupsController < ApplicationController
  before_action :correct_user

  def index
    @groups = current_user.groups.order(name: "ASC")
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_posts_path(@group)
    else
      render :edit
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to groups_path
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def correct_user
    if request.referer.nil?
      redirect_to root_path
    end
  end
end
