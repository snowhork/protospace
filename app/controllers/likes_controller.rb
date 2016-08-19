class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.save
    @prototype = Prototype.find(params[:prototype_id])
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    @prototype = Prototype.find(params[:prototype_id])
  end

  private

  def like_params
    params.permit(:prototype_id).merge(user_id: current_user.id)
  end
end
