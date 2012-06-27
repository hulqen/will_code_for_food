class CreateSlCustomRows < ActiveRecord::Migration
  def change
    create_table :sl_custom_rows do |t|
      t.integer :shopping_list_id
      t.integer :custom_product_id
      t.boolean :in_basket

      t.timestamps
    end
  end
end
