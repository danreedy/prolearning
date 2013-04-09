class DashboardController < ApplicationController
  before_filter :authenticate_user!

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

  def batch
    conditions = []
    case params[:owner].downcase
    when "me"
      conditions << [ "where", "teacher_id = #{current_user.id}"]
    when "other teachers"
      conditions << [ "where", "teacher_id != #{current_user.id}"]
    end
    case params[:batch].downcase
    when "first two"
      conditions << [ "order", "recorded_on, created_at ASC" ]
      conditions << [ "limit", "2" ]
    when "rest"
      conditions << [ "order", "recorded_on, created_at ASC" ]
      conditions << [ "offset", 2 ]
    end

    conditions << [ "where", "type_of_school = ?", params[:type_of_school]] unless params[:type_of_school] == "All"
    conditions << [ "where", "course_id IN (?)", Course.where(:name => params[:course])] unless params[:course] == "All"
    conditions << [ "where", "school_year = ?", params[:school_year]] unless params[:school_year] == "All"
    conditions << [ "where", "semester = ?", params[:semester]] unless params[:semester] == "All"

    @batch = RecordingSheet.batch(conditions)


    @batch_summary = {:teacher => {}, :student => {}, :grouping => {}, :topic => {}} 
    @batch.each do |rs|
      @batch_summary[:teacher].merge!(rs.summarize[:teacher]){|k,a,b|a+b}
      @batch_summary[:student].merge!(rs.summarize[:student]){|k,a,b|a+b}
      @batch_summary[:grouping].merge!(rs.summarize[:grouping]){|k,a,b|a+b}
      @batch_summary[:topic].merge!(rs.summarize[:topic]){|k,a,b|a+b}
    end
    render :json => @batch_summary
  end
end
