class SlCustomRow < ActiveRecord::Base
  attr_accessible :custom_product_id, :in_basket, :shopping_list_id, :custom_product_name
  belongs_to :shopping_list
  belongs_to :custom_product

  delegate :name, :to => :custom_product, :prefix => true, :allow_nil => true

  def custom_product_name= (value)
    self.custom_product = CustomProduct.find_or_create_by_name(value)
  end

end
