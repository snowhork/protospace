class Prototype < ActiveRecord::Base
  has_many :images

  belongs_to :user

  accepts_nested_attributes_for :images

  validate :prototype_must_have_main_image_to_upload_some_images, on: :create

  def main_image
    images.each do |image|
      return image if image.main_flag
    end
  end

  private

  def prototype_must_have_main_image_to_upload_some_images
    if images.present?
      images.each do |image|
        return if image.main_flag
      end
      errors.add(:prototype, "must have main image to upload some images")
    end
  end
end
