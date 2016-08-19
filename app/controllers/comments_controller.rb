class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.save
    @prototype = Prototype.find(params[:prototype_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
          .merge(prototype_id: params[:prototype_id],
                 user_id: current_user.id)
  end
end
