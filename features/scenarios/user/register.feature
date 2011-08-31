
Feature: Register

  As an Oil Professional
  I want  to register to the website
  So that I can log-in

  Background:
    Given I am on the HomePage page


  Scenario: Successful Registration
    When I register with unique user
    Then I should see the WelcomePage page
    And I logout


  Scenario: Registration with an Existing Username
    Given There is a existing user
    When I register with existing user
    Then I should see the registration error messages for field name:
      """
      has already been taken
      """
    And I go back to the Login screen



  Scenario: Registration Form with Blank Values
    When I register with blank user

    Then I should see the registration error messages for field name:
      """
      can't be blank
      is too short (minimum is 3 characters)
      """

    And I should see the registration error messages for field email:
      """
      can't be blank
      Invalid email
      """

    And I should see the registration error messages for field password:
      """
      can't be blank
      is too short (minimum is 3 characters)
      """

    And I should see the registration error messages for field password-confirmation:
      """
      can't be blank
      """

    And I go back to the Login screen


    @wip
  Scenario: Registration Form with Invalid Email

    When I register with invalid_email user

    Then I should not see any registration error messages for fields:
      | name                  |
      | password              |
      | password-confirmation |

    And I should see the registration error messages for field email:
      """
      Invalid email
      """

    And I go back to the Login screen