require 'factory_girl'

FactoryGirl.define do
  factory :record do
    recording_sheet
    minute 1
    teacher 'P'
    student 'L'
    grouping 'c'
    topic 'c'
    notes ''
    summary ''
  end
end
