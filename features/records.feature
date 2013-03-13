Feature: Record minute by minute class interaction

    Scenario: When a record with a minute different than the interval is recorded
        Given I am logged in as an observer
        And a recording sheet exists
        When a record with a minute different than the interval gets added
        Then nothing gets saved in the summary 

    Scenario: When a record with a minute equal than the interval is recorded
        Given I am logged in as an observer
        And a recording sheet exists
        When a record with a minute equal than the interval gets added
        Then summary of the past interval gets saved 
