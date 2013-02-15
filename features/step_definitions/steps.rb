Given /^I am logged in$/ do
    login_as_admin
end

Given /^a course exists$/ do
    @course = fabricate_course
end

Given /^a recording sheet exists$/ do
    @recording_sheet = fabricate_recording_sheet
end

When /^I add a course$/ do
    add_course
end

When /^I create a new recording sheet with that course$/ do
    @recording_sheet = add_recording_sheet :course => @course
end

When /^a record with a minute (.*?) than the interval gets added$/ do |type|
    if type == "equal"
      @minute = 5
      @interval = 5
    else
      @minute = 2
      @interval = 5
    end
    @record = add_record @recording_sheet, @minute
end

Then /^the new course appears in the courses list$/ do
    find_course 
end

Then /^I can see the course assigned to the recording sheet$/ do
    assert_recording_sheet_presence @recording_sheet, :course => @course
end

Then /^nothing gets saved in the summary$/ do
    verify_record_summary @record, @interval
end

Then /^summary of the past interval gets saved$/ do
    verify_record_summary @record, @interval
end
