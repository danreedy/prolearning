class Record < ActiveRecord::Base
  belongs_to :recording_sheet
  attr_accessible :grouping, :minute, :notes, :student, :teacher, :topic

  def string
    teacher.to_s + student.to_s + grouping.to_s + topic.to_s
  end
end
