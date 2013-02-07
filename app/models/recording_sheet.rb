class RecordingSheet < ActiveRecord::Base
  belongs_to :observer, :class_name => "User"
  belongs_to :teacher, :class_name => "User"
  belongs_to :department
  belongs_to :course
  has_many :records

  attr_accessible :course_id, :interval, :number_of_students, :recorded_on, :school_year, :semester, :type_of_school, :observer_id, :teacher_id, :department_id

  validates_presence_of :course_id, :interval, :number_of_students, :recorded_on, :school_year, :semester, :type_of_school, :observer_id, :teacher_id, :department_id
end
