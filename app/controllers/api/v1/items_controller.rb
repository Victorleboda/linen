class Api::V1::ItemsController < Api::V1::BaseController
  def show
    @item = Item.find_by!(product_code: params[:id])
  end

  def create
    @item = Item.new(title: params[:title], category: compute_category(params[:category].downcase), price: params[:price], product_code: params[:product_code], photo: params[:photo], url: params[:url], gender: params[:gender])# TODO code hash
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

  # def item_params
  #   params.require(:item).permit(:title, :category, :url, :photo, :product_code, :price)
  # end

  def compute_category(raw_category)
    if raw_category.include? "pull"
      return "pull"
    elsif raw_category.include? "robe"
      return "robe"
    elsif raw_category.include? "cardigan"
      return "cardigan"
    end
    return raw_category
  end

  def render_error
    render json: { errors: @item.errors.full_messages },
      status: :unprocessable_entity
  end
end
