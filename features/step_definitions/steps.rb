Given /^I am logged in$/ do
    login_as_admin
end

Given /^a course exists$/ do
    @course = fabricate_course
end

When /^I add a course$/ do
    add_course
end

When /^I create a new recording sheet with that course$/ do
    @recording_sheet = add_recording_sheet :course => @course
end

Then /^the new course appears in the courses list$/ do
    find_course 
end

Then /^I can see the course assigned to the recording sheet$/ do
    assert_recording_sheet_presence @recording_sheet, :course => @course
end
