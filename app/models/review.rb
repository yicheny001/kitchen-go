class Review < ApplicationRecord
  validates :content, presence: true
  belongs_to :reader
  belongs_to :recipe
  
  def review_image_url
    self.reader.user.image
  end

  def review_username
    self.reader.user.name
  end

end
