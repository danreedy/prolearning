require 'factory_girl'

FactoryGirl.define do
  factory :admin, :class => :user do
    email 'mmorales@las.ch'
    password '123456789'
    password_confirmation '123456789'
  end

  factory :teacher, :class => :user do
    email 'teacher@las.ch'
    password 'qwer!@#$'
    password_confirmation 'qwer!@#$'
  end

  factory :observer, :class => :user do
    email 'observer@las.ch'
    password '123456789'
    password_confirmation '123456789'
  end
end
