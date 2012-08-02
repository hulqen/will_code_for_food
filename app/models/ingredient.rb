# encoding: utf-8
class Ingredient < ActiveRecord::Base
  Units = %w[ml cl dl l g hg kg st burk skiva nypa krm tsk msk pkt knippe]

  attr_accessible :amount, :product_name, :unit_name

  belongs_to :recipe
  belongs_to :unit
  belongs_to :product

  validates_presence_of :product
  validates_presence_of :amount, :if => proc { unit_name.present? }
  validates_inclusion_of :unit_name, :in => Units, :if => :amount

  delegate :name, :to => :product, :prefix => true, :allow_nil => true

  before_save :convert_unit

  def unit_name=(new_unit_name)
    unit_id_will_change!
    @unit_name = new_unit_name
  end

  def unit_name
    @unit_name || unit.try(:name)
  end

  def product_name= (value)
    self.product = Product.find_or_create_by_name(value)
  end

  protected

  def convert_unit
    final_unit, new_amount = case unit_name
      when "ml"
        ["l", amount / 1000]
      when "cl"
        ["l", amount / 100]
      when "dl"
        ["l", amount / 10]
      when "hg"
        ["g", amount * 100]
      when "kg"
        ["g", amount * 1000]
      else
        unit_name
    end

    self.amount = new_amount if new_amount != nil
    self.unit = Unit.find_by_name!(final_unit)
  end


end
