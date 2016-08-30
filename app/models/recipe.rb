class Recipe < ApplicationRecord

  validates :title, presence: true
  validates :content, presence: true
  belongs_to :author
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :bookmarks
  has_many :reviews
  has_many :readers, through: :bookmarks
  has_many :recipe_categories
  has_many :categories, through: :recipe_categories
  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :ingredients

  def title=(title)
    write_attribute(:title, title.downcase)
  end

  def norm_title
    read_attribute(:title).split.map do |word|
      word.capitalize
    end.join(" ")
  end

  def self.most_bookmarked(num)
    top_bookmark_hash = Bookmark.group('recipe_id').order("count(*) desc limit #{num}").count('recipe_id')

    top_recipes = top_bookmark_hash.keys.map {|key| self.find(key).title }
    top_recipes_count = top_bookmark_hash.values

    top_recipes.zip(top_recipes_count).compact

  end 


  def self.most_recent(num)
    order("created_at desc limit #{num}").to_a
  end

  def self.top_ingredients(num)
    top_ing_hash = RecipeIngredient.group('ingredient_id').order("count(*) desc limit #{num}").count('ingredient_id')
    # {1=>9}
    # 1 (cucumber) is the most used ingredient. 9 is the count. 
    top_ingredients = []
    
    top_ing_hash.each do |id, count|
      top_ingredients<< Ingredient.find(id)
    end
    top_ingredients 
  end

  def self.search_by_ingredient(ingredient)
    Recipe.joins(:ingredients).where("ingredients.name like ?", "%#{ingredient}%")
  end

  def self.search(cuisine)
    Recipe.where("title like ?", "%#{cuisine}%")
  end


  def who_bookmarked
    recipe.bookmarks.map do |bookmark|
      Reader.find(bookmark.reader_id).user
    end
  end

  def recipe_rating
    all_ratings = self.reviews.map do |review|
      review[:rating]
    end
    total_reviews = self.reviews.count
    sum = all_ratings.reduce(:+)
    if !sum.nil?
      (sum)/(total_reviews) 
    end
  end

  def display_rating
    if self.recipe_rating != 0
      self.recipe_rating.to_s + 'out of 5'
    end
  end

  def display_image
    if self.image == ''
      '/none.png'
    else
      self.image
    end
  end



end
