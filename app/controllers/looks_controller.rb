class LooksController < ApplicationController
  def create
    @look = current_user.looks.create(post_id: params[:post_id])
  end

  def destroy
    @look = Look.find_by(post_id: params[:post_id], user_id: current_user.id)
    @look.destroy
  end
end
