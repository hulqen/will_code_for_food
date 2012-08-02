Feature: View a list of recieps

  In order to cook something
  As a visitor
  I want to see a list of recipes

  Scenario: View a list of recipes
    Given there is a recipe called "Korv stroganoff" that has servings "5" and cook time "20 minuter"
    And I am on the "recipes" page
    Then I should see the recipe "Korv stroganoff"
