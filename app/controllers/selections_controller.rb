# frozen_string_literal: true

class SelectionsController < ApplicationController
  def index
    @selections = Selection.where(user: current_user)
    @items = []
    @selections.each do |selection|
      @items << selection.item
    end
  end
end
