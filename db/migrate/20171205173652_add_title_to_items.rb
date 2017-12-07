# frozen_string_literal: true

class AddTitleToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :title, :string
  end
end
