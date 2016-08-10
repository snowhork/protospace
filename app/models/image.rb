class Image < ActiveRecord::Base
  mount_uploader :substance, SubstanceUploader

  belongs_to :prototype
end
