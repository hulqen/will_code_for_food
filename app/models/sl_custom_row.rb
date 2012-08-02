# encoding: utf-8
class SlCustomRow < ActiveRecord::Base
  attr_accessible :in_basket, :custom_product_name
  belongs_to :shopping_list
  belongs_to :custom_product

  validates_presence_of :custom_product_id

  delegate :name, :to => :custom_product, :prefix => true, :allow_nil => true

  def custom_product_name= (value)
    self.custom_product = CustomProduct.find_or_create_by_name(value)
  end

end
