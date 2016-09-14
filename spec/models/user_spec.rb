require 'rails_helper'

RSpec.describe User, :type => :model do
  describe '#create' do
    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end
  end
end
