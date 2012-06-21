# encoding: utf-8
module RecipeHelper

  def create_recipe(name)
    @recipe = Recipe.create!(:name => name, :servings => 4, :cook_time => "20 minuter")
    %w[korv potatis ris].each do |product|
      params = {:amount => "200", :unit_name => "kg", :product_name => product}
      @recipe.ingredients.create!(params)
    end
    %w[skära stek sov].each do |instruction|
      @recipe.instructions.create!(:text => instruction)
    end
    @recipe
  end
end

World(RecipeHelper)
