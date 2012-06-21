Feature: View the recipe collection

  As a user
  To collect my favourite recipes, and to plan my eating
  I want to collect recipes in collections

  Scenario: A new user should have 2 recipe collection
    Given I am logged in
    And I am on the "recipe collections" page
    Then I should see the recipe collection "Min receptsamling"
    Then I should see the recipe collection "Min veckoplan"
