FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    gender { 'male' }
    birth_date { Date.parse('11.12.2000') }
    active true
    association :role, :user

    trait :admin do
      association :role, :admin
    end
  end
end
