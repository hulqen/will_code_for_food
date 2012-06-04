class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.integer :step
      t.string :text
      t.integer :recipe_id

      t.timestamps
    end
  end
end
