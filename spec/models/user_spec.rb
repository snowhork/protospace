require 'rails_helper'

RSpec.describe User, :type => :model do
  describe '#create' do
    describe 'with valid attribtues' do
      it "is valid with a nickname, email, password, password_confirmation" do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    describe 'without valid attributes' do
      it 'is invalid without a nickname' do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end

      it 'is invalid without a email' do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end


    end

  end
end
