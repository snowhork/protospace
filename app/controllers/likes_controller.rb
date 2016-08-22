class LikesController < ApplicationController
  include UsersHelper

  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @like = Like.new(like_params)
    flash.now[:danger] = comment.errors.full_messages[0] unless @like.save
    set_prototype
  end

  def destroy
    like = Like.find(params[:id])
    if is_instance_current_users?(like)
      flash.now[:danger] = comment.errors.full_messages[0] unless like.destroy
    end
    set_prototype
  end

  private

  def like_params
    params.permit(:prototype_id).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
