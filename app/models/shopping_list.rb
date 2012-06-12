class ShoppingList < ActiveRecord::Base
  attr_accessible :name, :user_id, :sl_product_row
  belongs_to :user
  has_many :sl_product_rows, :dependent => :delete_all

  accepts_nested_attributes_for :sl_product_rows, :allow_destroy => :true

  def add_recipe(recipe)
    recipe.ingredients.each do |i|
      params = {:amount => i.amount, :product_id => i.product_id, :recipe_id => i.recipe_id, :shopping_list_id => self.id, :unit_id => i.unit_id}
      # puts params.inspect
      self.sl_product_row = params
    end
  end

  def sl_product_row= (value)
    SlProductRow.create!(value)
  end

end
