Feature: View a single recipe collection

  As a user
  To view the recipes in my collection
  I want to view the details of the recipe collection

  Scenario: View a single recipe collection
    Given I am logged in
    And there is a unit called "g"
    And I have added the recipes "Korvsallad", "Salladskorv" and "Glasstårta" to the recipe collection "Min veckoplan"
    And I am on the "recipe collections" page
    When I view "Min veckoplan"
    Then I should see recipes "Korvsallad", "Salladskorv" and "Glasstårta" in "måndag", "tisdag" and "onsdag"
