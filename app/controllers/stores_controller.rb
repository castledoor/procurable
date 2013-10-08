class StoresController < ApplicationController


  def index
    @stores = Store.all
    @store = Store.new
  end

  def new
    @store = Store.new
  end

  def create
    @store = current_user.stores.new(store_params)
    if @store.save
      flash[:notice] = "Awesome, you just opened shop!"
       redirect_to(@store)
    elsif 
      flash[:notice] = "You cannot create a store without being logged in"
    else 
      render '/'
    end
  end

  def show
    @store = Store.find(params[:id])
    @item = @store.items.new
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
      respond_to do |format|
        format.html do
          flash[:notice] = "Your store details have been edited"
          redirect_to store_path
        end
        format.js
      end
    else
      render :edit
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    flash[:notice] = "BOOOM! Your store has been deleted"
    redirect_to root_path
  end

private
  def store_params
    params.require(:store).permit(:name)
  end
end