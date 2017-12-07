# frozen_string_literal: true

class AddItemReferenceToSelections < ActiveRecord::Migration[5.1]
  def change
    add_reference :selections, :item, foreign_key: true, index: true
  end
end
