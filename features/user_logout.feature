Feature: User logging out

  As a user
  To end my session at matplanera
  I want to be able to log out

  Scenario: User logs out
    Given the user "mat@plan.se" is logged in
    And the user logs out
    Then the user should see "Utloggad!"
