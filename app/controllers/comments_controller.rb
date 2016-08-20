class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    comment = Comment.new(comment_params)
    flash.now[:danger] = comment.errors.full_messages[0] unless comment.save
    set_prototype
  end

  def destroy
    comment = Comment.find(params[:id])
    if is_instance_current_users?(comment)
      flash.now[:danger] = comment.errors.full_messages[0] unless comment.destroy
    end
    set_prototype
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
          .merge(prototype_id: params[:prototype_id],
                 user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
