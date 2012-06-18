module ShoppingListHelper

  def unique_ingredients_for(sl)
    sl.unique_ingredients.each do |product_name_and_unit, amount|
      unit         = product_name_and_unit[1]
      product_name = product_name_and_unit[0]
      yield amount.round, unit, product_name
    end
  end
end