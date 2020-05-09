class PostsController < ApplicationController
  before_action :set_group

  def index
    @post = Post.new
    @posts = @group.posts.includes(:user)
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
  end
end
