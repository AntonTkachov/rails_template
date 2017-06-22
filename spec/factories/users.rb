FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    gender { 'male' }
    birth_date { Date.parse('11.12.2000') }
    active true

    trait :admin do
      association :role, :admin
    end

    trait :user do
      association :role, :user
    end
  end
end
