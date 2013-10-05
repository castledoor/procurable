class ItemsController < ApplicationController

  def new
    @item = Item.new(item_params)
  end

  def create
    @item = Item.create!(item_params)
    respond_to do |format|
      format.html { redirect_to @item.store }
      format.js
    end
  end

private

  def item_params
    params.require(:item).permit(:price, :description, :image_link, :store_id) # MUST DELETE STORE_ID AT SOME POINT
  end
end