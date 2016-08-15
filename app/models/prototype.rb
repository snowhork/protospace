class Prototype < ActiveRecord::Base
  has_many :images

  belongs_to :user, counter_cache: true

  accepts_nested_attributes_for :images

  validate :prototype_must_have_main_image_to_upload_some_images, on: :create

  def main_image
    images.each do |image|
      return image if image.main_flag
    end
  end

  def sub_images
    subs = []
    images.each do |image|
      subs << image unless image.main_flag
    end
    return subs
  end

  def display_date
    created_at.strftime("%b %d")
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
