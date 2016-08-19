class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :prototype, counter_cache: true

  delegate :nickname, to: :user
end
