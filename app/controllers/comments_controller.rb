class CommentsController < ApplicationController
  def create
    if user_signed_in?
      comment = Comment.new(comment_params)
      unless comment.save
        flash.now[:danger] = comment.errors.full_messages[0]
      end
    end
    @prototype = Prototype.find(params[:prototype_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
          .merge(prototype_id: params[:prototype_id],
                 user_id: current_user.id)
  end
end
