@settings

Feature: User settings
  In order to manage user settings
  As a regular user
  I want manage my own settings

  Background:
    Given I am "Harry Potter"
    And I am on the user settings page

  Scenario: Changing the default department
    Then I should see "Default department"
    And I should see "Hogwarts"
    When I select "Hogwarts" from "user_config[default_dept]"
    And I press "Submit"
    And I go to the homepage
    Then the page should indicate that I am in the department "Hogwarts"
    When I go to the user settings page
    And I select "Outer Space" from "user_config[default_dept]"
    And I press "Submit"
    And I go to the homepage
    Then the page should indicate that I am in the department "Outer Space"

  Scenario: Changing the days displayed in shifts
#     This test will not work if you happen to run it
#     for the first day of the shift cycle (sunday if weekly)
    Given I had a shift yesterday
    And today is not Sunday
    When I select "Whole pay period" from "View week"
    And I press "Submit"
    And I go to shifts for this week
    Then I should see all the days of the week
    And I should see "Harry Potter"
    When I go to the user settings page
    And I choose "Show only shift schedule for the remaining days of the week"
    And I press "Submit"
    And I go to shifts for this week
    Then I should see all the days of the week
    And I should not see "Harry Potter"

  Scenario: What LocGroups to display on schedule view
    Given I have a LocGroup named "Classrooms" with location "Potions"
    And I have a LocGroup named "Gryffindor" with location "Common Room"
    Then I should see "Classrooms"
    When I check "Classrooms"
    And I go to shifts
    Then I should see "Potions"
    And I should not see "Common Room"

    When I go to the user settings page
    And I check "Gryffindor"
    And I uncheck "Classrooms"
    And I go to shifts
    Then I should see "Common Room"
    And I should not see "Potions"
