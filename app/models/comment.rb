class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :prototype, counter_cache: true

  delegate :nickname, to: :user

  validates :text, length: { maximum: 500 }, presence: true
end
