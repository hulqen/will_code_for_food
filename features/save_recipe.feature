Feature: Save a recipe

  As a user
  In order to remeber the tasty things I've eaten
  I want to save recipes in the database

  Background: Saving a recipe
    Given I am logged in
    And I am on the "new_recipe" page
    And I create a recipe called "Laxpytt" with servings "5", cook time "20 minuter" and instructions "skala laxen" and "stek potatis"

  Scenario: My saved recipe in the list
    When I am on the "recipes" page
    Then I should see the recipe "Laxpytt"

  Scenario: Viewing my saved recipe
    When I am on the "recipes" page
    When I view "Laxpytt"
    Then I should see servings "5" and cook time "20 minuter"
    And I should see instruction "skala laxen"
    And I should see instruction "stek potatis"
