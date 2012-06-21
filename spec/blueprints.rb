require 'machinist/active_record'

User.blueprint do
  email           { "User #{sn}" }
  password        { "password #{sn}" }
end

ShoppingList.blueprint do
  name            { "Min shoppinglista#{sn}"}
end

Recipe.blueprint do
  cook_time       {"#{sn} minuter" }
  name            { "Korv#{sn}" }
  servings        { rand(20) }
  instructions(3)
  ingredients(3)
end

Instruction.blueprint do
  text            { "instruktion#{sn}"}
  step            { rand(20) }
end

Ingredient.blueprint do
  amount          { rand(200) }
  unit
  product
end

Unit.blueprint do
  name            { "unit_name#{sn}"}
end

Product.blueprint do
  name            { "product_name#{sn}"}
end

