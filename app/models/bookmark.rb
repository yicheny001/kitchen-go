class Bookmark < ApplicationRecord
  validates :recipe_id, uniqueness: true
  
  belongs_to :reader
  belongs_to :recipe

  def show_recipe
    Recipe.find(self.recipe_id)
  end

  def recipe_title
    self.show_recipe.title
  end

  def truncate_content
    self.show_recipe.content[0, 47] + "..."
  end




end
