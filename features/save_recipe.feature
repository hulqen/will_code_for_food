Feature: Save a recipe

  As a user
  In order to remeber the good things I've ate
  I want to save recipes in the database

  Scenario: Saving a recipe
    Given I am logged in
    And I am on the "new_recipe" page
    And I create a recipe called "Laxpytt" with servings "5" and cook time "20 minuter"
    When I am on the "recipes" page
    Then I should see the recipe "Laxpytt"
    And show me the page