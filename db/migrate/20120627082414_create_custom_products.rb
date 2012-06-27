class CreateCustomProducts < ActiveRecord::Migration
  def change
    create_table :custom_products do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
