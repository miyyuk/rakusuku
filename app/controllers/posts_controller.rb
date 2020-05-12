class PostsController < ApplicationController
  before_action :set_group

  def index
    @post = Post.new
    @posts = @group.posts.includes(:user)
    @looks = Look.new
  end

  def show
    @post = Post.find(params[:id])
    @looks = Look.new
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def create
    @post = @group.posts.new(post_params)
    if @post.save
      redirect_to group_posts_path(@group)
    else
      @posts = @group.posts.includes(:user)
      render :index
    end
  end

  private
  def post_params
    params.require(:post).permit(:content, { files: [] }).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
