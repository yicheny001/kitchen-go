class RemovesCategoryIdFromRecipes < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :category_id
  end
end
