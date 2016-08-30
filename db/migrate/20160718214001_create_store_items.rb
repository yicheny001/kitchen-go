class CreateStoreItems < ActiveRecord::Migration[5.0]
  def change
    create_table :store_items do |t|
      t.string :name
      t.string :price
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
