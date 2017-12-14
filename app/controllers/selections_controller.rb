# frozen_string_literal: true

class SelectionsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :create
  skip_before_action :verify_authenticity_token, only: :create
  before_action :set_selection, only: [:destroy]

  def index
    @selection_pool = Selection.joins(:item).where(user: current_user)
    @categories = Item.joins(:selections).where(selections: {user: current_user }).pluck(:category).uniq
    @selections = @selection_pool
    if params[:item].present?
      terms = params[:item].keys
      @selections = terms.map do |term|
        @selection_pool.where('items.category = :query', query: term)
      end.reduce(:|)
    end
    respond_to do |format|
      format.html
      format.js
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

  def set_selection
    @selection = Selection.find(params[:id])
  end
end
