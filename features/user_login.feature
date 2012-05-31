Feature: User login

  As a user
  To be able to use the service fully
  I want to be able to login

  Scenario: Logging in
    Given I, "mat@plan.se", have an account
    When I log in
    Then I should get the message "Inloggad! Välkommen mat@plan.se"
