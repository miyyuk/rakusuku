class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to group_post_path(id: @post.id)
    else
      # errorメッセージの表示を追加予定
      @comments = @post.comments.includes(:user).order("created_at DESC")
      redirect_to group_post_path(id: @post.id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
