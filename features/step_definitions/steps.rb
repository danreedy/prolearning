Given /^I am logged in$/ do
    login_as_admin
end

When /^I add a course$/ do
    add_course
end

Then /^the new course appears in the courses list$/ do
    find_course 
end
