class Ingredient < ActiveRecord::Base
  attr_accessible :amount, :unit_name, :product_name, :unit_id
  belongs_to :recipe
  belongs_to :product
  belongs_to :unit

  delegate :name, :to => :product, :prefix => true, :allow_nil => true

  def unit_name= (value)
    self.unit = Unit.find_or_create_by_name(value)
  end

  def product_name= (value)
    self.product = Product.find_or_create_by_name(value)
  end

end
