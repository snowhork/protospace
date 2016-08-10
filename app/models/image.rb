class Image < ActiveRecord::Base
  mount_uploader :substance, SubstanceUploader
end
