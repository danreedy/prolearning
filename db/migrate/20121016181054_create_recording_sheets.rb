class CreateRecordingSheets < ActiveRecord::Migration
  def change
    create_table :recording_sheets do |t|
      t.references :observer
      t.references :teacher
      t.date :recorded_on
      t.integer :school_year
      t.string :semester
      t.references :department
      t.string :type_of_school
      t.string :course
      t.integer :number_of_students
      t.integer :interval

      t.timestamps
    end
    add_index :recording_sheets, :observer_id
    add_index :recording_sheets, :teacher_id
    add_index :recording_sheets, :department_id
  end
end
