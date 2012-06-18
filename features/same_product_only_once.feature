Feature: Products with the same name and unit should only appear once in the shopping list

  As a user
  To get a shopping list without too many duplicates
  I want ingredients that are the same product and same unit to be on the same line, only with their amounts combined

  Scenario: Two recipes with the same products
    Given I am logged in
    And there is a recipe called "Korv stroganoff" that has servings "5" and cook time "20 minuter" and the following ingredients:
      | amount | unit      | product|
      | 300    | gram      | korv   |
      | 5      | dl        | ris    |

    And there is a recipe called "Korvgryta" that has servings "5" and cook time "20 minuter" and the following ingredients:
      | amount | unit      | product|
      | 500    | gram      | korv   |
      | 9      | dl        | ris    |

    And I have added the recipe "Korv stroganoff" to my shopping list
    And I have added the recipe "Korvgryta" to my shopping list
    When I am on the "shopping list" page
    Then I should see the ingredient "800" "gram" "korv"
    And I should see the ingredient "14" "dl" "ris"
