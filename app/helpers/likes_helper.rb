module LikesHelper
  def user_likes_prototype?(user, prototype)
    Like.find_by(user_id: user.id, prototype_id: prototype.id).present?
  end

  def like_form(like, prototype, &block)
    if user_signed_in?
      if user_likes_prototype?(current_user, prototype)
        form_tag prototype_like_path(prototype.id, like.id), method: :delete, remote: true, &block
      else
        form_tag prototype_likes_path(prototype.id), method: :post, remote: true, &block
      end
    end
  end

  def like_icon(prototype)
    if user_signed_in? && user_likes_prototype?(current_user, prototype)
      "icon_heart_red.svg"
    else
      "icon_heart.svg"
    end
  end
end
