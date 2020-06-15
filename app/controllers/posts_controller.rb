class PostsController < ApplicationController
  before_action :correct_user
  before_action :set_group

  def index
    @post = Post.new
    @post_file = @post.post_files.build
    @posts = @group.posts.includes(:user).order(created_at: "DESC")
    @looks = Look.new
  end

  def show
    @post = Post.find(params[:id])
    @looks = Look.new
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: "DESC")
  end

  def create
    @post = @group.posts.new(post_params)
    if @post.save
      if params[:post_files].present?
        params[:post_files][:file].each do |a|
          @post_file = @post.post_files.create!(file: a, post_id: @post.id)
        end
      end
      respond_to do |format|
        format.json
      end
    else
      @posts = @group.posts.includes(:user).order(created_at: "DESC")
      render :index
    end
  end

  private
  def post_params
    params.require(:post).permit(:content, :release_check, :release_date, post_files_attributes: [:file]).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def correct_user
    if request.referer.nil?
      redirect_to root_path
    end
  end
end
