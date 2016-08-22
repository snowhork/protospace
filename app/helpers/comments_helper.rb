module CommentsHelper
  def comment_nickname(user)
    if user.present?
      user.nickname
    else
      "no name"
    end
  end
end
