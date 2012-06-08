class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :recipe_id
      t.decimal :amount, :precision => 9, :scale => 4
      t.integer :unit_id
      t.integer :product_id

      t.timestamps
    end
  end
end
