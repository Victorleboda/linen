class Api::V1::ItemsController < Api::V1::BaseController
  def show
    @item = Item.find_by(product_code: params[:id])
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
