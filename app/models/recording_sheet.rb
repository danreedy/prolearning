class RecordingSheet < ActiveRecord::Base
  belongs_to :observer, :class_name => "User"
  belongs_to :teacher, :class_name => "User"
  belongs_to :department
  has_many :records

  attr_accessible :course, :interval, :number_of_students, :recorded_on, :school_year, :semester, :type_of_school, :observer_id, :teacher_id, :department_id
end
