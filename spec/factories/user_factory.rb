require 'factory_girl'

FactoryGirl.define do
  factory :admin, :class => :user do
    email 'mmorales@las.ch'
    password '123456789'
    password_confirmation '123456789'
  end
end
