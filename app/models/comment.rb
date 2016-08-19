class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :prototype

  delegate :nickname, :avatar, to: :user
end
