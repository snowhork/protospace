class Prototype < ActiveRecord::Base
  has_many :images, dependent: :destroy

  belongs_to :user, counter_cache: true

  delegate :nickname, :works, to: :user

  accepts_nested_attributes_for :images, reject_if: :all_blank

  validate :prototype_must_have_main_image_to_upload_some_images, on: [:create, :update]

  paginates_per 8

  def main_image
    images.select {|image| image.main_flag }[0]
  end

  def sub_images
    images.select {|image| !image.main_flag }
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
