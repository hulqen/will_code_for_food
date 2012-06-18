Given /^I have added the recipe "(.*?)" to my shopping list$/ do |recipe_name|
  recipe = Recipe.find_by_name(recipe_name)
  @user.shopping_list.add_recipe(recipe)
end
