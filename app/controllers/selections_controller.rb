# frozen_string_literal: true

class SelectionsController < ApplicationController
  def index
    @selections = Selection.where(user: current_user)
    @items = []
    @selections.each do |selection|
      @items << selection.item
    end
  end

  def create
    raise
    @selection = Selection.new()
    @selection.user = current_user
    @selection.item = Item.find(selection_params)
  end

  private

  def selection_params
   params.require(:selection).permit(:item_id)
  end
end
