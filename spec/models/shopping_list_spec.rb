require File.dirname(__FILE__) + '/../spec_helper'

describe "Shopping List" do

  it "should not have any products" do
    sl = ShoppingList.new
    sl.sl_product_rows.should be_empty
  end

  context "when adding a recipe to the shopping list" do
    before do
      @recipe1 = Recipe.make!
      @sl1 = ShoppingList.make!
      @preferred_servings = 6
      @sl1.add_recipe(@recipe1, @preferred_servings)
    end

    it "should not not empty" do
      @sl1.sl_product_rows.should_not be_empty
    end

    it "should have the ingredients as its product rows"
  end
end