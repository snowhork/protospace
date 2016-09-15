require 'rails_helper'

RSpec.describe Image, :type => :model do
  describe 'validation' do
    it 'is valid with right format' do
      image = build(:image)
      expect(image).to be_valid
    end

    it 'is invalid with wrong format' do
      image = build(:image, :wrong_format)
      image.valid?
      expect(image.errors[:substance]).to include('is invalid')
    end
  end
end
