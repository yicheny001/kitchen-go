class LineItem < ApplicationRecord
	belongs_to :shopping_list
	belongs_to :ingredient
end
