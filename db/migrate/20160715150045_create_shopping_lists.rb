class CreateShoppingLists < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_lists do |t|
      t.integer :user_id
      t.float :total_price
    end
  end
end
