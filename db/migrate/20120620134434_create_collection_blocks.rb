class CreateCollectionBlocks < ActiveRecord::Migration
  def change
    create_table :collection_blocks do |t|
      t.integer :position
      t.string :name
      t.integer :recipe_collection_id

      t.timestamps
    end
  end
end
