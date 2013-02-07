class Course < ActiveRecord::Base
  has_many :recording_sheets
  attr_accessible :name
end
