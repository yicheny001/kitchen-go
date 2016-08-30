module Services
  class SupermarketClient
    include HTTParty

    BASE_URL_ZIP = "http://www.supermarketapi.com/api.asmx/StoresByZip?APIKEY=6615d53884"
    BASE_URL_ITEM = "http://www.SupermarketAPI.com/api.asmx/COMMERCIAL_SearchForItem?APIKEY=6615d53884"

    def zip_search(zip)
      self.class.get(BASE_URL_ZIP, {query: {ZipCode: zip}})
    end

    def item_search(store_id, item)
      self.class.get(BASE_URL_ITEM, {query: {StoreId: store_id, ItemName: item}})
    end
    #=> collection_proxy/array of items in the given store that might fit 
    # http://www.SupermarketAPI.com/api.asmx/COMMERCIAL_SearchForItem?APIKEY=APIKEY&StoreId=123456&ItemName=Apple

  end
end