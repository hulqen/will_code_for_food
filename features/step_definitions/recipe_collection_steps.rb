# encoding: utf-8
Then /^I should see the recipe collection "(.*?)"$/ do |recipe_collection|
  page.should have_content(recipe_collection)
end

Given /^I have added the recipes "(.*?)", "(.*?)" and "(.*?)" to the recipe collection "(.*?)"$/ do |recipe1, recipe2, recipe3, recipe_collection|
  @user.recipe_collections.find_by_name(recipe_collection).collection_blocks.find(2).add_recipe(create_recipe(recipe1), 6)
  @user.recipe_collections.find_by_name(recipe_collection).collection_blocks.find(3).add_recipe(create_recipe(recipe2), 6)
  @user.recipe_collections.find_by_name(recipe_collection).collection_blocks.find(4).add_recipe(create_recipe(recipe3), 6)
end

Then /^I should see "(.*?)", "(.*?)" and "(.*?)"$/ do |block1, block2, block3|
  page.should have_content(block1)
  page.should have_content(block2)
  page.should have_content(block3)
end

Then /^I should see recipes "(.*?)", "(.*?)" and "(.*?)" in "(.*?)", "(.*?)" and "(.*?)"$/ do |recipe1, recipe2, recipe3, block1, block2, block3|
  page.find('li', :text => block1).should have_content(recipe1)
  page.find('li', :text => block2).should have_content(recipe2)
  page.find('li', :text => block3).should have_content(recipe3)
end