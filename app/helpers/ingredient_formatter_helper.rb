module IngredientFormatterHelper

  def unique_ingredients_for(sl)
    sl.unique_ingredients.each do |product_name_and_unit, incoming_amount|
      unit_name    = product_name_and_unit[1]
      product_name = product_name_and_unit[0]
      
      if incoming_amount == 0
        amount     = nil

      elsif unit_name == "l"
        amount = number_to_human(incoming_amount, :units => :liquid)
        unit_name = nil
      elsif unit_name == "g"
        amount = number_to_human(incoming_amount, :units => :weight)
        unit_name = nil
      else
        amount = number_with_precision(incoming_amount, :precision => 5 , :separator => ',', :strip_insignificant_zeros => :true)
      end

      yield amount, unit_name, product_name
    end
  end

  def humanize_ingredients(i)
    i.each do |ingr|
      if ingr.unit_name == "l"
        amount = number_to_human(ingr.amount, :units => :liquid, :precision => 5 , :separator => ',', :strip_insignificant_zeros => :true)
        unit_name = nil
      elsif ingr.unit_name == "g"
        amount = number_to_human(ingr.amount, :units => :weight, :precision => 5 , :separator => ',', :strip_insignificant_zeros => :true)
        unit_name = nil
      else
        amount = number_with_precision(ingr.amount, :precision => 5 , :separator => ',', :strip_insignificant_zeros => :true)
        unit_name = ingr.unit_name
      end
      yield amount, unit_name, ingr.product_name
    end
  end
end