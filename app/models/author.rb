class Author < ApplicationRecord
  belongs_to :user
  has_many :recipes
  
  def most_liked
    most_liked_recipe_id = Recipe.where(author_id: self.id).joins(:bookmarks).group('recipes.id').count('recipes.id').max_by{|k,v| v}
      Recipe.find(most_liked_recipe_id[0])
    end

  def view_who_bookmarked
    self.recipes.each do |recipe|
      recipe.who_bookmarked
    end
  end

  def my_recipe?(recipe)
    # self.recipes.include?(recipe)
    self.recipes.exists?(recipe)
  end

  def my_recipe_bookmarked?(recipe)
    if my_recipe?(recipe)
      !recipe.bookmarks.empty?
    end
  end

end
