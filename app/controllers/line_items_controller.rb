class LineItemsController < ApplicationController


  def create
    current_user.shopping_list.line_items << LineItem.create(line_item_params)
  end

  private

  def line_item_params
    params.require(:line_item).permit(:shopping_list_id, :ingredient_id)
  end

end
