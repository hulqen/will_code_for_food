class ChangeColumnInBasketOnSlCustomRow < ActiveRecord::Migration
  def up
    change_column :sl_custom_rows, :in_basket, :boolean, :default => false, :null => false
  end

  def down
    change_column :sl_custom_rows, :in_basket, :boolean, :default => nil, :null => true
  end
end
