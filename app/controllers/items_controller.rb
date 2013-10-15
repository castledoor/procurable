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

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "This item has been deleted"
    redirect_to store_path
  end

private

  def item_params
    params.require(:item).permit(:price, :description, :image_link, :store_id) # MUST DELETE STORE_ID AT SOME POINT
  end
end