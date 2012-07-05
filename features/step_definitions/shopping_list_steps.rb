# encoding: utf-8
Given /^I have added the recipe "(.*?)" to my shopping list$/ do |recipe_name|
  recipe = Recipe.find_by_name(recipe_name)
  @user.shopping_list.add_recipe(recipe)
end

When /^I add the following stuff: "(.*?)", "(.*?)", "(.*?)"$/ do |stuff1, stuff2, stuff3|
  click_link('Lägg till rad')
  fill_in()
end