class Image < ActiveRecord::Base
  mount_uploader :substance, SubstanceUploader

  belogs_to :prototype
end
