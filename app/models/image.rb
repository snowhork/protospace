class Image < ActiveRecord::Base
  mount_uploader :substance, SubstanceUploader

  belongs_to :prototype

  validates :substance, presence: true, format: { with: /\A.+\.(jpg|JPG|jpeg|JPEG|png|PNG)\z/}
end
