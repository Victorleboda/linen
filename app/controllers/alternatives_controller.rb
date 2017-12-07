# frozen_string_literal: true

class AlternativesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @good_alternative = []
    @item = Item.find(params[:item_id])
    category = @item.category
    items_category = Item.where(category: category)
    items_category.each do |item_category|
      if item_category.color_water && item_category.color_air && item_category.color_climate == 'green'
        @good_alternative << item_category
      end
    end
    respond_to do |format|
      format.html
      format.json { render json: @good_alternative }
    end
  end
end
