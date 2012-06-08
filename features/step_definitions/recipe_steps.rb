Given /^there is a recipe called "(.*?)" that has servings "(.*?)" and cook time "(.*?)" and the following ingredients:$/ do |name, servings, cook_time, table|
  @recipe = Recipe.create!(:name => name, :servings => servings, :cook_time => cook_time)
  table.hashes.each do |row|
    params = {:amount => row[:amount], :unit_name => row[:unit], :product_name => row[:product]}
    @recipe.ingredients.create!(params)
  end
end

Given /^the instructions:$/ do |row|
  row.hashes.each do |t|
    @recipe.instructions.create!(t)
  end
end

Given /^the recipe has the instruction "(.*?)"$/ do |instruction_text|
  @recipe.instructions.create! :text => instruction_text
end

Then /^I should see instruction "(.*?)"$/ do |instruction_text|
  page.should have_content(instruction_text)
end

Then /^I should see the recipe "(.*?)"$/ do |recipe_name|
  page.should have_content(recipe_name)
end

Then /^I should see servings "(.*?)" and cook time "(.*?)"$/ do |servings, cook_time|
  page.should have_content(servings)
  page.should have_content(cook_time)
end

Then /^I should see the ingredient "(.*?)" "(.*?)" "(.*?)"$/ do |amount, unit, product|
  page.should have_content(amount)
  page.should have_content(unit)
  page.should have_content(product)
end

Given /^I create a recipe called "(.*?)" with servings "(.*?)", cook time "(.*?)" and instructions "(.*?)" and "(.*?)"$/ do |name, servings, cook_time, instr1, instr2|
  fill_in('recipe_name', :with => name)
  select(servings, :from => 'recipe_servings')
  fill_in('recipe_cook_time', :with => cook_time)
  fill_in('recipe_instructions_attributes_0_text', :with => instr1)
  fill_in('recipe_instructions_attributes_1_text', :with => instr2)
  click_button('Spara recept')
end