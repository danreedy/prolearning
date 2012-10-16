class Department < ActiveRecord::Base
  has_many :recording_sheets
  attr_accessible :name

  validates_presence_of :name
end
