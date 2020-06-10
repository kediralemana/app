@mod @mod_login @app @javascript
Feature: Test basic usage of login in app
  I need basic login functionality to work

  Background:
    Given the following "courses" exist:
      | fullname | shortname |
      | Course 1 | C1        |
    And the following "users" exist:
      | username | firstname | lastname |
      | student1 | david     | student  |
      | student2 | pau       | student2 |
      | teacher1 | juan      | teacher  |
    And the following "course enrolments" exist:
      | user     | course | role           |
      | student1 | C1     | student        |
      | student2 | C1     | student        |
      | teacher1 | C1     | editingteacher |

    @app @3.8.0 @OK
    Scenario: Add a non existing site
    When I enter the app
    And I log in as "student1"
    And I press "menu" in the app
    And I press "Change site" in the app
    And I press "add" in the app
    And I set the field "Site address" to "Wrong Site Address" in the app
    And I press "Connect!" in the app
    Then I should see "Error"
    And I should see "Double check you've entered the address correctly and try again."

    @app @3.8.0 @OK
    Scenario: Delete a site
    When I enter the app
    And I log in as "student1"
    And I press "menu" in the app
    And I press "Change site" in the app
    Then I should see "Acceptance test site"
    And I press "Delete" in the app
    And I press "trash" in the app
    And I press "Delete" in the app
    Then I should not see "Acceptance test site"
    And I should see "Connect to Moodle"

    @app @3.8.0 @mobile @OK
    Scenario: Require minium version of the app for a site and site name in displayed when adding a new site (mobile)
    When I enter the app
    Then I should see "Acceptance test site"
    And I log in as "teacher1"
    And I press "menu" in the app
    And I press "Website" in the app
    And I switch to the browser tab opened by the app
    And I follow "Log in"
    And I log in as "admin"
    And I press "Side panel"
    And I follow "Site administration"
    And I follow "Mobile authentication"
    And I set the field "Minimum app version required" to "3.8.1"
    And I press "Save changes"
    And I close the browser tab opened by the app
    When I enter the app
    And I log in as "teacher1"
    And I press "menu" in the app
    And I press "Website" in the app
    And I switch to the browser tab opened by the app
    And I follow "Log in"
    And I log in as "admin"
    And I press "Side panel"
    And I follow "Site administration"
    And I follow "Mobile authentication"
    And I set the field "Minimum app version required" to "3.8.2"
    And I press "Save changes"
    And I close the browser tab opened by the app
    When I enter the app
    Then I should see "App update required"

    @app @3.8.0 @tablet @OK
    Scenario: Require minium version of the app for a site and site name in displayed when adding a new site (tablet)
    When I enter the app
    And I change viewport size to "1280x1080"
    Then I should see "Acceptance test site"
    And I log in as "teacher1"
    And I press "menu" in the app
    And I press "Website" in the app
    And I switch to the browser tab opened by the app
    And I follow "Log in"
    And I log in as "admin"
    And I follow "Site administration"
    And I follow "Mobile authentication"
    And I set the field "Minimum app version required" to "3.8.1"
    And I press "Save changes"
    And I close the browser tab opened by the app
    When I enter the app
    And I change viewport size to "1280x1080"
    And I log in as "teacher1"
    And I press "menu" in the app
    And I press "Website" in the app
    And I switch to the browser tab opened by the app
    And I follow "Log in"
    And I log in as "admin"
    And I follow "Site administration"
    And I follow "Mobile authentication"
    And I set the field "Minimum app version required" to "3.8.2"
    And I press "Save changes"
    And I close the browser tab opened by the app
    When I enter the app
    And I change viewport size to "1280x1080"
    Then I should see "App update required"