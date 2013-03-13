Feature: Courses

    Scenario: The one where admins define courses
        Given I am logged in as an admin
        When I add a course
        Then the new course appears in the courses list 

    Scenario: The one where observers add a course to a recording sheet
        Given I am logged in as an observer
        And a course exists
        When I create a new recording sheet with that course
        Then I can see the course assigned to the recording sheet
