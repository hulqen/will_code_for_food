Feature: View details of a single recipe

  As a hungry person
  In order to know how to cook a recipe
  I want to check the details of a recipe

  Scenario: Viewing details of a recipe
    Given there is a unit called "l"
    And there is a unit called "g"
    And there is a recipe called "Korv stroganoff" that has servings "6" and cook time "20 minuter" and the following ingredients:
      | amount | unit      | product|
      | 300    | g         | korv   |
      | 5      | dl        | ris    |
    And the instructions:
      | text |
      | Koka riset          |
      | Skär korven i stavar|

    And I am on the "recipes" page
    When I view "Korv stroganoff"
    Then I should see servings "6" and cook time "20 minuter"
    And I should see the ingredient "3" "hekto" "korv"
    And I should see the ingredient "5" "deciliter" "ris"
    And I should see instruction "Koka riset"
    And I should see instruction "Skär korven i stavar"