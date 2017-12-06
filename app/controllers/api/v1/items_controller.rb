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
  def create
    @item = Item.new(item_params)
    @item.brand = Brand.find_or_create_by(name: params[:brand][:name])
    params[:assemblings].each do |assembling_params|
      @item.assemblings.build(percent: assembling_params[:percent], material: Material.find_or_create_by(name: assembling_params[:material][:name]))
    end
    if @item.save
      render :show
    else
      render_error
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :category, :url, :photo, :product_code, :price)
  end

  def render_error
    render json: { errors: @item.errors.full_messages },
      status: :unprocessable_entity
  end
end
