class AddSummaryToRecords < ActiveRecord::Migration
  def change
    add_column :records, :summary, :string
  end
end
