include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :image do
    substance { fixture_file_upload('spec/fixtures/img/test.jpg', 'image/jpg') }
    main_flag true
    created_at { Faker::Time.between(2.days.ago, Time.now, :all)}

    trait :wrong_format do
      substance { fixture_file_upload('spec/fixtures/img/test.aaa', 'image/aaa') }
    end
  end
end
