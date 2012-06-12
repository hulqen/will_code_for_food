class CreateSlProductRows < ActiveRecord::Migration
  def change
    create_table :sl_product_rows do |t|
      t.integer :shopping_list_id
      t.integer :product_id
      t.integer :unit_id
      t.decimal :amount, :precision => 9, :scale => 4
      t.integer :recipe_id
      t.boolean :in_basket

      t.timestamps
    end
  end
end
