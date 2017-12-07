# frozen_string_literal: true

class CreateSelections < ActiveRecord::Migration[5.1]
  def change
    create_table :selections, &:timestamps
  end
end
