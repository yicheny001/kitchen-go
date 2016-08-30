class ShoppingList < ApplicationRecord
	belongs_to :user
	has_many :line_items
	has_many :ingredients, through: :line_items
  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |a| a[:title].blank? }
  accepts_nested_attributes_for :line_items, :reject_if => lambda { |a| a[:title].blank? }

	def click_to_add(ingredient)
		self.line_items << LineItem.create(ingredient_id: ingredient.id,shopping_list_id: self.id)
	end


  def count_same_ingredients
    self.class.joins(:ingredients).where(user_id: self.user.id).group('ingredients.name').count('ingredients.name')
  end


   def remove_selected_items(items)
      items.each do |item|
        if !item.empty?
          line_item = self.line_items.find_by(ingredient_id: item)
          self.line_items.delete(line_item.id)
        end
      end
    end
	
  def remove_all_items
    line_items.clear
  end

  def add_selected_items(items)
    items.each do |item|
        if !item.empty?
          self.line_items.build(ingredient_id: item, shopping_list_id: self.id)
        end
      end
  end

  def item_count(item)
    self.ingredients.where(name: item.name).count
  end

  def distinct_ingredients
    self.ingredients.select('distinct ingredients.name')
    # all_names = self.class.joins(:ingredients).group('ingredients.name').count('ingredients.name').keys
    # no_duplicates = []
    # all_names.each do |name|
    #   no_duplicates << self.ingredients.find_by(name: name)
    # end
    # no_duplicates 
  end

  def show_ingredient_ids 
    self.ingredients.pluck(:id)
  end

  def show_ingredient_names
    self.ingredients.pluck(:name)
  end

    



end
