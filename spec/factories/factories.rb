FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { "foobar123" }
    password_confirmation { "foobar123" }
  end
end
