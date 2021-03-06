# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, only: %i[edit update show destroy]

  def new
    @item = Item.new
  end

  def show
    # une partie pour l'extension
  end

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
