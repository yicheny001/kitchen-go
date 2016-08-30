class CreateRecipeCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_categories do |t|
      t.integer :category_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
