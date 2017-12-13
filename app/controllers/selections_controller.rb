# frozen_string_literal: true

class SelectionsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :create
  skip_before_action :verify_authenticity_token, only: :create
  before_action :set_selection, only: [:destroy]

  def index
    @selections = Selection.where(user: current_user)
    @items = current_user.items
    @categories = Item.pluck(:category).uniq

    @items = @items.where(category: params[:item].keys) if params[:item].present?

    # if params[:item].present?
    #   items_with_filters = []
    #   @items.each do |element|
    #     if params[:item].keys.include?(element.category)
    #       items_with_filters << element
    #     end
    #   end
    #   @items = items_with_filters
    # end
    respond_to do |format|
      format.html # render selections/index.html.erb
      format.js # render selections/index.js.erb
    end
  end

  def create
    @selection = Selection.new()
    @selection.user = current_user
    @selection.item = Item.find(params[:item_id])
    @selection.save
  end

  def destroy
    @selection.destroy
    respond_to do |format|
      format.html { redirect_to selections_path }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
  end
  private

  # def selection_params
    # params.require(:selection).permit(:item_id)
  # end

  def set_selection
    @selection = Selection.find(params[:id])
  end
end
