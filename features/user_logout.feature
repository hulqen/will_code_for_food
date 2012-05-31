Feature: User logging out

  As a user
  To end my session at matplanera
  I want to be able to log out

  Scenario: User logs out
    Given I, "mat@plan.se", is logged in
    And I log out
    Then I should get the message "Utloggad!"
