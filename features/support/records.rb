module RecordsWorld
  MINUTE_SELECTOR = 'Minute'
  CREATE_RECORD_BUTTON = 'Create Record'

  def add_record(recording_sheet, minute)
    @record = FactoryGirl.attributes_for :record
    visit new_recording_sheet_record_path(recording_sheet)
    fill_in MINUTE_SELECTOR, :with => minute 
    click_on CREATE_RECORD_BUTTON
    Record.last
  end
  
  def verify_record_summary(record, interval)
    if record.minute == interval
      Record.find(record).summary.should_not == nil
    else
      Record.find(record).summary.should == nil
    end
  end
end

World(RecordsWorld)
