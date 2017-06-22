FactoryGirl.define do
  factory :role do
    trait :admin do
      title 'Admin'
    end

    trait :user do
      title 'User'
    end
  end
end
