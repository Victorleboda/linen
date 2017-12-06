class Api::V1::ItemsController < Api::V1::BaseController
  def show
    @item = Item.find(params[:id])

    @good_alternatives = []
    @item = Item.find_by(product_code: @item.product_code)
    item_categories = Item.where(category: @item.category).where.not(id: @item.id)
    item_categories.each do |item_category|
      if item_category.color_water && item_category.color_air && item_category.color_climate== "good_impact"
        @good_alternatives << item_category
      end
    end
  end
end
