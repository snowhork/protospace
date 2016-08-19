class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :prototype

  delegate :nickname, to: :user
end
