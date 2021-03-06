class ShoppingList < ActiveRecord::Base
  attr_accessible :name, :user_id, :sl_product_row, :sl_custom_rows_attributes
  belongs_to :user
  has_many :sl_product_rows, :dependent => :delete_all
  has_many :sl_custom_rows,  :dependent => :delete_all

  accepts_nested_attributes_for :sl_product_rows, :allow_destroy => :true
  accepts_nested_attributes_for :sl_custom_rows, :reject_if => lambda { |a| a[:custom_product_name].blank? }, :allow_destroy => :true

  def add_recipe(recipe, preferred_servings)
    amount_multiplier = preferred_servings.to_f / recipe.servings
    recipe.ingredients.each do |i|
      create_sl_product_row(i, amount_multiplier)
    end
  end

  def create_sl_product_row(i, amount_multiplier)
    params = {
      :amount => (i.amount * amount_multiplier if i.amount),
      :product_id => i.product_id,
      :recipe_id => i.recipe_id,
      :unit_id => i.unit_id
    }
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

  def unique_ingredients(in_basket)
    sl_product_rows.where(:in_basket => in_basket).each_with_object(Hash.new(0)) do |row, result|
      unit   = row.unit.try(:name) || nil
      amount = row.amount          || 0
      result[[row.product.name, unit]] += amount
    end
  end

end