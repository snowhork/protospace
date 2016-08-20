module LikesHelper
  def user_likes_prototype?(user, prototype)
    Like.find_by(user_id: user.id, prototype_id: prototype.id).present?
  end
end
