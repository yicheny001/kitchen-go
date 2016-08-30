class Reader < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :reviews
  has_many :recipes, through: :bookmarks

  def is_bookmarked?(recipe)
    if self.recipes.empty?
      false
    else
      self.recipes.include?(recipe)
    end
  end

  def is_reviewed?(reviews)
    reviews.exists?(reader_id: self.id)
  end

  def my_review_id(recipe)
    self.reviews.find_by(recipe_id: recipe).id
  end

  def has_reviews(num)
    self.reviews[0...num].map {|review| review }
  end

end
