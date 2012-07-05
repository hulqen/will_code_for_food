# encoding: utf-8
require 'machinist/active_record'

User.blueprint do
  email           { "User #{sn}" }
  password        { "password #{sn}" }
end

ShoppingList.blueprint do
  name            { "Min shoppinglista#{sn}" }
end

Recipe.blueprint do
  cook_time       {"#{sn} minuter" }
  name            { "Korv#{sn}" }
  servings        { rand(20) }
  instructions(3)
  ingredients(3)
end

Instruction.blueprint do
  text            { "instruktion#{sn}" }
  step            { rand(20) }
end

Ingredient.blueprint do
  product         { Product.make }
end

Ingredient.blueprint(:with_unit) do
  unit            { Unit.make! }
  amount          { 1 }
end

Unit.blueprint do
  name            { "unit_name#{sn}" }
end

Product.blueprint do
  name            { "product_name#{sn}" }
end

