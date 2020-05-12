class LooksController < ApplicationController
  before_action :set_post

  def create
    @look = current_user.looks.create(post_id: @post.id)
    redirect_to group_posts_path(id: @post.id)
  end

  def destroy
    @look = Look.find_by(post_id: @post.id, user_id: current_user.id)
    @look.destroy
    redirect_to group_posts_path(id: @post.id)
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end
