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

  factory :budget_item do
    name { "Budget Item" }
    amount { 500.00 }
    notebook
  end
end
