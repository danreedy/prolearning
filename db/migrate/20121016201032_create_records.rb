class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :minute
      t.string :teacher
      t.string :student
      t.string :grouping
      t.string :topic
      t.text :notes
      t.references :recording_sheet

      t.timestamps
    end
    add_index :records, :recording_sheet_id
  end
end
