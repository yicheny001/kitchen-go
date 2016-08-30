class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.integer :cart_id
      t.integer :ingredient_id
      t.float :price

      t.timestamps
    end
  end
end
