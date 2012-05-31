Given /^there is a recipe called "(.*?)" with servings "(.*?)" and cook time "(.*?)"$/ do |name, servings, cook_time|
  @recipe = Recipe.create!(:name => name, :servings => servings, :cook_time => cook_time)
end

Then /^I should see the recipe "(.*?)"$/ do |recipe_name|
  page.should have_content(recipe_name)
end

Then /^I should see servings "(.*?)" and cook_time "(.*?)"$/ do |servings, cook_time|
  page.should have_content(servings)
  page.should have_content(cook_time)
end

Given /^I create a recipe called "(.*?)" with servings "(.*?)" and cook time "(.*?)"$/ do |name, servings, cook_time|
  fill_in('recipe_name', :with => name)
  select(servings, :from => 'recipe_servings')
  fill_in('recipe_cook_time', :with => cook_time)
  click_button('Spara recept')
end