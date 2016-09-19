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

      it 'is invalid without a password' do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it 'is invalid without a password_confirmation although with a password' do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it 'is invalid with a duplicate email address' do
        user = create(:user)
        another_user = build(:user)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end

      it 'is invalid with a password than has less than 6 characters' do
        user = build(:user, password: '12345', password_confirmation: '12345')
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end
    end

  end
end
