# frozen_string_literal: true

class SelectionsController < ApplicationController
  before_action :set_selection, only: [:destroy]
  def index
    @selections = Selection.where(user: current_user)
    @items = []
    @selections.each do |selection|
      @items << selection.item
    end
  end

  def create
    @selection = Selection.new()
    @selection.user = current_user
    @selection.item = Item.find(selection_params)
  end

  def destroy
    @selection.destroy
    respond_to do |format|
      format.html { redirect_to selections_path }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
  end
  private

  def selection_params
    params.require(:selection).permit(:item_id)
  end

  def set_selection
    @selection = Selection.find(params[:id])
  end
end
