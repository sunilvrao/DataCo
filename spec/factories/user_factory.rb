FactoryGirl.define do
  factory :user do
    name 'John Doe'
    email 'a@b.com'
    password '123456'
    password_confirmation '123456'
  end
end