Given /^I have added the recipe "(.*?)" to my shopping list$/ do |recipe|
  @recipe = Recipe.find_by_name(recipe)
  @user.shopping_list.add_recipe(@recipe)
end