class CreateRecipeCollections < ActiveRecord::Migration
  def change
    create_table :recipe_collections do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
