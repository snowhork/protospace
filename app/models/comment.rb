class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :prototype, counter_cache: true

  validates :text, length: { maximum: 500 }, presence: true

  def nickname
    if user.present?
      user.nickname
    else
      "no name"
    end
  end
end
