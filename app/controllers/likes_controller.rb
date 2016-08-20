class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.save
    set_prototype
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
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
