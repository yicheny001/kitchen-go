class StoresController < ApplicationController

	def create
		zip = params[:zip]
		adapter = Services::SupermarketAdapter.new
		store = adapter.get_stores_by_zip(zip).first	
		@store = Store.find_by(storeID: store["StoreId"])
		shopping_list = ShoppingList.find_by(user_id: session[:user_id])
		items = shopping_list.show_ingredient_names
		item_monster_array = items.map do |item| 
			adapter.get_store_items(@store.storeID, item)
		end
		
		# @items = item_monster_array.map do |item_hash|
		# 	byebug
		# 	StoreItem.find_by(description: item_hash["ItemDescription"])
		# end
		@ingredients_items = {}

		
		items_array = item_monster_array.map do|item_array|
			item_array[0..4].map do |item_hash|
				StoreItem.find_by(description: item_hash["ItemDescription"])
			end
		end

		zipped = items.zip(items_array)

		zipped.each do |array|
			@ingredients_items[array[0]] = array[1]
		end

		render "stores/show"
		# @items = item_monster_array.map {|item_array| item_array.map {|item_hash| StoreItem.find_by(description: item_hash["ItemDescription"]) }}

	end


	def show
	end

	def index
	end

end
