class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :author_id
      t.integer :category_id
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
