class LooksController < ApplicationController
  before_action :set_group

  def create
    @post = Post.find(params[:post_id])
    look = current_user.looks.create(post_id: params[:post_id])
    redirect_to group_posts_path(group_id: @group.id)
  end

  def destroy
    @post = Post.find(params[:post_id])
    look = Look.find_by(post_id: params[:post_id], user_id: current_user.id)
    look.destroy
    redirect_to group_posts_path(group_id: @group.id)
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
  end
end
