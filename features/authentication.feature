Feature: Authentication
  In order to track my submissions
  As a user
  I want to be able to login

  Scenario Outline: Creating a new account
    Given I am not authenticated
    When I go to register
    And I fill in "user_email" with "<email>"
    And I fill in "user_password" with "<password>"
    And I fill in "user_password_confirmation" with "<password>"
    And I press "Sign up"
    Then I should see "Welcome <email>"

    Examples:
      | email           | password   |
      | testing@man.net | secretpass |
      | foo@bar.com     | fr33z3     |

  Scenario: Willing to edit my account
    Given I am a new, authenticated user
    When I go to edit my account
    Then I should see "Edit User"
    # Then show me the page
