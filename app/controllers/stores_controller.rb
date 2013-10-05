class StoresController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
  end

  def create
    @store = current_user.stores.new(store_params)
    if @store.save
      flash[:notice] = "Awesome, you just opened shop!"
       redirect_to(@store)
    else 
      render '/'
    end
  end

  def show
    @store = Store.find(params[:id])
  end

private
  def store_params
    params.require(:store).permit(:name)
  end
end