class Record < ActiveRecord::Base
  belongs_to :recording_sheet
  attr_accessible :grouping, :minute, :notes, :student, :teacher, :topic
end
