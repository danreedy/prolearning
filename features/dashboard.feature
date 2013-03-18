Feature: Teacher Dashboard

    Scenario: Every user has a dashboard
        Given I am logged in as a teacher
        When I click on the dashboard link in the menu
        Then I see the dashboard page
