# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :category
      t.string :url
      t.string :photo
      t.float :price
      t.string :product_code
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
