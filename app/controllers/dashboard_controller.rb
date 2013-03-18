class DashboardController < ApplicationController
  def index
    @first_batch = RecordingSheet.where(:teacher_id => current_user.id)
                                 .order("recorded_on, created_at ASC")
                                 .limit(2)
    @second_batch = RecordingSheet.where(:teacher_id => current_user.id)
                                  .order("recorded_on, created_at ASC")
                                  .offset(2)
    @first_batch_summary = {:teacher => {}, :student => {}, :grouping => {}, :topic => {}} 
    @first_batch.each do |recording_sheet|
      @first_batch_summary[:teacher].merge!(recording_sheet.summarize[:teacher]){|k,val_from_a,val_from_b|val_from_a+val_from_b}
      @first_batch_summary[:student].merge!(recording_sheet.summarize[:student]){|k,val_from_a,val_from_b|val_from_a+val_from_b}
      @first_batch_summary[:grouping].merge!(recording_sheet.summarize[:grouping]){|k,val_from_a,val_from_b|val_from_a+val_from_b}
      @first_batch_summary[:topic].merge!(recording_sheet.summarize[:topic]){|k,val_from_a,val_from_b|val_from_a+val_from_b}
    end

    @second_batch_summary = {:teacher => {}, :student => {}, :grouping => {}, :topic => {}} 
    @second_batch.each do |recording_sheet|
      @second_batch_summary[:teacher].merge!(recording_sheet.summarize[:teacher]){|k,val_from_a,val_from_b|val_from_a+val_from_b}
      @second_batch_summary[:student].merge!(recording_sheet.summarize[:student]){|k,val_from_a,val_from_b|val_from_a+val_from_b}
      @second_batch_summary[:grouping].merge!(recording_sheet.summarize[:grouping]){|k,val_from_a,val_from_b|val_from_a+val_from_b}
      @second_batch_summary[:topic].merge!(recording_sheet.summarize[:topic]){|k,val_from_a,val_from_b|val_from_a+val_from_b}
    end
  end
end
