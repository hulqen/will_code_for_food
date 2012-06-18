Feature: Removal of a recipe from shopping list should not remove the product if there is another recipe with the same product

  As a user
  To get correct products on the shopping list
  I want ingredients that appears in more than one recipe to remain in the list when I remove a recipe that contains that product (with the same amount) as another recipe

  Scenario: Shopping list with the same products
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
    When I remove the recipe "Korvgryta"
    Then I should see the ingredient "300" "gram" "korv"
    And show me the page
