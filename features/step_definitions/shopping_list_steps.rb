# encoding: utf-8
Given /^I have added the recipe "(.*?)" to my shopping list$/ do |recipe_name|
  recipe = Recipe.find_by_name(recipe_name)
  @user.shopping_list.add_recipe(recipe)
end

When /^I add the following stuff: "(.*?)", "(.*?)", "(.*?)"$/ do |stuff1, stuff2, stuff3|
  find '.edit_shopping_list' do
    click_link 'Lägg till rad'
  end
  find '.edit_shopping_list' do
    find '.fields:nth-child(4)' do 
      fill_in stuff1
    end
  end
    # find '.fields:nth-child(5)' do 
    #   fill_in stuff2
    # end
    # find '.fields:nth-child(6)' do 
    #   fill_in stuff3
    # end
end