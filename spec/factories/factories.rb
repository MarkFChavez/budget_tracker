FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { "foobar123" }
    password_confirmation { "foobar123" }
  end

  factory :notebook do
    name { "Savings" }
    description { "my savings budget" }
    user
  end
end
