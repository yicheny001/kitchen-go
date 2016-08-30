module Services
  class SupermarketAdapter
    def get_stores_by_zip(zipcode)
      response = Services::SupermarketClient.new.zip_search(zipcode)
      response.parsed_response["ArrayOfStore"]["Store"].each do |store|
        Store.create(name: store["Storename"], address: store["Address"], city: store["City"], state: store["State"], zip: store["Zip"], phone: store["Phone"], storeID: store["StoreId"])
      end
    end

    # def find_close_storeid(zipcode)
    # 	get_stores_by_zip(zipcode)[0]["StoreID"]
    # end

    # storeid = find_close_storeid(zipcode)
    def get_store_items(storeid, item)
    	response = Services::SupermarketClient.new.item_search(storeid, item)
    	response.parsed_response["ArrayOfProduct_Commercial"]["Product_Commercial"].each do |item|
    		StoreItem.create(name: item["Itemname"], image: item["ItemImage"], description: item["ItemDescription"], price: item["Pricing"])
      end
    end

	end
end

