FactoryGirl.define do
  factory :prototype do
    title 'TAITORU'
    concept 'KONSEPUTO'
    catch_copy 'KYATIKOPII'
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }

    trait :with_images do
      images { create_list(:image, 1, main_flag: true) +
        create_list(:image, 2, main_flag: false) }
    end

    trait :with_likes do
      likes { create_list(:like, 3) }
    end

    trait :with_comments do
      comments { create_list(:comment, 3) }
    end

    trait :jan_first do
      created_at '2000/01/01'
    end
  end
end
