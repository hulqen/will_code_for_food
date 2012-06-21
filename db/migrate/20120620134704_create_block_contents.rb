class CreateBlockContents < ActiveRecord::Migration
  def change
    create_table :block_contents do |t|
      t.integer :position
      t.string :comment
      t.string :collection_block_id
      t.integer :recipe_id
      t.integer :preferred_servings

      t.timestamps
    end
  end
end
