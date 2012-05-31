Feature: View details of a single recipe

  As a hungry person
  In order to know how to cook a recipe
  I want to check the details of a recipe

  Scenario: Viewing details of a recipe
    Given there is a recipe called "Korv stroganoff" with servings "5" and cook time "20 minuter"
    And I am on the "recipes" page
    When I view "Korv stroganoff"
    Then I should see servings "5" and cook_time "20 minuter"