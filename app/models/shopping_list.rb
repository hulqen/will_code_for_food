class ShoppingList < ActiveRecord::Base
  attr_accessible :name, :user_id, :sl_product_row
  belongs_to :user
  has_many :sl_product_rows, :dependent => :delete_all

  accepts_nested_attributes_for :sl_product_rows, :allow_destroy => :true

  def add_recipe(recipe)
    recipe.ingredients.each do |i|
      create_sl_product_row(i)
    end
  end

  def create_sl_product_row(i)
    params = {:amount => i.amount, :product_id => i.product_id, :recipe_id => i.recipe_id, :unit_id => i.unit_id}
    sl_product_rows.create!(params)
  end

  def recipe_id_for(name)
    row = self.sl_product_rows.where("recipe_id = ?", Recipe.find_by_name(name))
    row[0].recipe_id
  end

  def unique_recipe_names
    recipe_names = []
    sl_product_rows.each_with_index do |row, i|
       recipe_names[i] = row.recipe.name
    end
    recipe_names.uniq
  end

  def unique_ingredients
    sl_product_rows.inject(Hash.new(0)) do |result, row|
      result[[row.product.name, row.unit.name]] += row.amount
      result
    end
  end

end