class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  has_many :line_items


  def self.show_without_items(array)
    if array.empty? 
      Ingredient.all
    else
    where("id NOT IN (?)", array)
    end
  end

end
