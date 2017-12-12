# frozen_string_literal: true

class SelectionsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :create
  skip_before_action :verify_authenticity_token, only: :create

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
    @selection.item = Item.find(params[:item_id])
    @selection.save
  end

end
