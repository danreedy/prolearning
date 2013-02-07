class ChangeCourseTypeInRecordingSheet < ActiveRecord::Migration
  def up
    remove_column :recording_sheets, :course
    add_column :recording_sheets, :course_id, :integer
  end

  def down
    add_column :recording_sheets, :course
    remove_column :recording_sheets, :course_id, :integer
  end
end
