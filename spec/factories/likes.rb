FactoryGirl.define do
  factory :like do
    user_id { Faker::Number.between(0,1000) }
  end
end
