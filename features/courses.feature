Feature: Courses

    Scenario: The one where admins define courses
        Given I am logged in
        When I add a course
        Then the new course appears in the courses list 
