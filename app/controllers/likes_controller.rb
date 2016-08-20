class LikesController < ApplicationController
  def create
    if user_signed_in?
      @like = Like.new(like_params)
      unless @like.save
        flash.now[:danger] = comment.errors.full_messages[0]
      end
    end
    set_prototype
  end

  def destroy
    like = Like.find(params[:id])
    if is_instance_current_users?(like)
      unless like.destroy
        flash.now[:danger] = comment.errors.full_messages[0]
      end
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
