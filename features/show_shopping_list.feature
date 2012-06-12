Feature: Show shopping list of the user

  As a user
  To be able to shop the stuffs to my recipes
  I want to see my shopping list

  Scenario: Show shopping list of the user
    Given I am logged in
    And there is a recipe called "Korv stroganoff" that has servings "5" and cook time "20 minuter" and the following ingredients:
      | amount | unit      | product|
      | 300    | gram      | korv   |
      | 5      | dl        | ris    |

    And I have added the recipe "Korv stroganoff" to my shopping list
    When I am on the "shopping list" page
    Then I should see the ingredient "300" "gram" "korv"
    And I should see the ingredient "5" "dl" "ris"
    And show me the page