class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  def new
    @item = Item.new
  end
# si c'est une page produit, faire une requete http au server (mettre scraper dans private)
# enregistrer dans database
  def create
    @item = Item.new(items_params)
    # if @item.save
    # else
    #   render :new
    # end
  end

  def destroy
    @item.destroy
  end


  private

  def items_params
    params.require(:items).permit(:category, :brand_id, :url, :photo, :price, :product_code)
  end
end
