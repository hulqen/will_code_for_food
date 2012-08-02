require 'acceptance/acceptance_helper'

feature "Servings", %q{
  In order to cook for a different amount of people
  As a user
  I want the amounts of the ingredients to change when I change servings
} do

  background do
    @recipe1 = Recipe.make!(
      :name => "Silltartar",
      :servings => 2,
      :ingredients => [Ingredient.make!(
        :amount => "200",
        :product => Product.make!(:name => "fisk"),
        :unit => Unit.make!(:name => "g")
        )]
      )
  end

  scenario "Recipe index" do
    visit '/recipes'
    page.should have_content('Silltartar')
  end

  scenario "Recipe details" do
    visit '/recipes'
    click_link 'Silltartar'
    page.should have_content('fisk')
  end

  # Needs javascript (the select submits the form)
  # scenario "change servings" do
  #   visit '/recipes'
  #   click_link 'Silltartar'
  #   select('6', :from => 'preferred_servings')
  #   page.should have_content("600 hekto fisk")
  # end
end