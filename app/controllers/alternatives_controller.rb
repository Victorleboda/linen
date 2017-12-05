class AlternativesController < ApplicationController
  def index
    @good_alternative = []
    @item = Item.find(params_id)
    category = @item.category
    items_category = Items.where(category: category)
    items_category.each do |item_category|
      if item_category.color_water && item_category.color_air && item_category.color_climate== "green"
        @good_alternative << item_category
      end
    end
  end
end
