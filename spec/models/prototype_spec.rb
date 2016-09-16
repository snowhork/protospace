require 'rails_helper'

RSpec.describe Prototype, :type => :model do
  describe 'associtions' do
    describe 'with comments' do
      it 'deletes the comments when prototype is deleted' do
        prototype = create(:prototype, :with_comments)
        expect { prototype.destroy }.to change(Comment, :count).by(-3)
      end

      it 'deletes the likes when prototype is deleted' do
        prototype = create(:prototype, :with_likes)
        expect { prototype.destroy }.to change(Like, :count).by(-3)
      end
    end
  end

  describe 'validation' do
    describe 'with valid attributes' do
      it 'has a valid factory' do
        prototype = build(:prototype)
        expect(prototype).to be_valid
      end
    end

    describe 'without valid attributes' do
      it 'is missng a title' do
        prototype = build(:prototype, title: nil)
        prototype.valid?
        expect(prototype.errors[:title]).to include("can't be blank")
      end

      it 'is missng a catch_copy' do
        prototype = build(:prototype, catch_copy: nil)
        prototype.valid?
        expect(prototype.errors[:catch_copy]).to include("can't be blank")
      end

      it 'is miisng a concept' do
        prototype = build(:prototype, concept: nil)
        prototype.valid?
        expect(prototype.errors[:concept]).to include("can't be blank")
      end
    end
  end

  describe '#display_date' do
    it 'returns dates in a specified format' do
      prototype = build(:prototype, :jan_first)
      expect(prototype.display_date).to eq 'Jan 01'
    end
  end

  describe 'about image' do
    let(:prototype) { create(:prototype, :with_images)}
    it 'main_image return main_image' do
      expect(prototype.main_image.main_flag).to be_truthy
    end

    it 'sub_images return sub_images' do
      expect(prototype.sub_images.map { |image| image.main_flag }).to all(be_falsey)
    end
  end
end
