require 'factory_girl'

FactoryGirl.define do
  factory :recording_sheet do
    observer
    teacher
    recorded_on Time.now
    school_year 2012
    semester '1st'
    department
    type_of_school 'IB'
    course
    number_of_students 4
    interval 5
  end
end
