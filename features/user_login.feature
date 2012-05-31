Feature: User login

  As a user
  To be able to use the service fully
  I want to be able to login

  Scenario: Logging in
    Given the user "mat@plan.se" has an account
    When the user logs in
    Then the user should see "Inloggad! Välkommen mat@plan.se"
