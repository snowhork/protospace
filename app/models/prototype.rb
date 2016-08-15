class Prototype < ActiveRecord::Base
  has_many :images

  accepts_nested_attributes_for :images

  validate :prototype_must_have_main_image_to_upload_some_images, on: :create

  def prototype_must_have_main_image_to_upload_some_images
    if images.present?
      images.each do |image|
        return if image.main_flag
      end
      errors.add(:prototype, "must have main image to upload some images")
    end
  end
end
