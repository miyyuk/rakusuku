class PostsController < ApplicationController
  before_action :set_group

  def index
    @post = Post.new
    4.times{ @post.post_files.build }
    @posts = @group.posts.includes(:user).order("created_at DESC")
    @looks = Look.new
  end

  def show
    @post = Post.find(params[:id])
    @looks = Look.new
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order("created_at DESC")
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to group_posts_path(@group)
    else
      @posts = @group.posts.includes(:user).order("created_at DESC")
      render :index
    end
  end

  private
  def post_params
    params.require(:post).permit(:content, post_files_attributes: [:file]).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
