Feature: Custom products in shopping list

  As a user
  In order to complement the shopping list
  I want to be able to add custom products

  Background: Adding custom stuffs
    Given I am logged in
    And I am on the "shopping list" page

  Scenario: A form for adding custom products to the shopping list
    Then I should see "Lägg till egna varor:"

  #TODO
  Scenario: Adding custom stuff to my shopping list

