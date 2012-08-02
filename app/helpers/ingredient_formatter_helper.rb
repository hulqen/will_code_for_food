module IngredientFormatterHelper

  def unique_ingredients_for(sl, in_basket)
    sl.unique_ingredients(in_basket).each do |product_name_and_unit, incoming_amount|
      unit_name    = product_name_and_unit[1]
      product_name = product_name_and_unit[0]

      if unit_name
        complete_ingredient = human_numbers(incoming_amount, unit_name)+" "+product_name
      else
        complete_ingredient = product_name
      end
      yield complete_ingredient, product_name
    end
  end

  def humanize_ingredients(ingredients, amount_multiplier)
    ingredients.each do |i|
      if i.unit
        amount_and_unit_name = human_numbers(i.amount * amount_multiplier, i.unit_name)
      else
        amount_and_unit_name = nil
      end
      yield amount_and_unit_name, i.product_name
    end
  end

  def human_numbers(amount, unit_name)
    number_to_human(amount, :units => unit_name, :precision => 5 , :separator => ',', :strip_insignificant_zeros => :true)
  end

end