class SlProductRow < ActiveRecord::Base
  attr_accessible :amount, :in_basket, :product_id, :recipe_id, :shopping_list_id, :unit_id
  belongs_to :shopping_list
  belongs_to :recipe
  belongs_to :product
  belongs_to :unit

  delegate :name, :to => :product, :prefix => true, :allow_nil => true
  delegate :name, :to => :unit, :prefix => true, :allow_nil => true
end
