require 'factory_girl'

FactoryGirl.define do

  factory :admin, :class => :user do
    sequence(:email) { |n| "admin#{n}@factory.com" }
    password '123456789'
    password_confirmation '123456789'
  end

  factory :teacher, :class => :user do
    sequence(:email) { |n| "teacher#{n}@factory.com" }
    password 'qwer!@#$'
    password_confirmation 'qwer!@#$'
  end

  factory :observer, :class => :user do
    sequence(:email) { |n| "observer#{n}@factory.com" }
    password '123456789'
    password_confirmation '123456789'
  end
end
