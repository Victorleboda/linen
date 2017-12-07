# frozen_string_literal: true

class CreateMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :materials do |t|
      t.string :name
      t.integer :climate_impact
      t.integer :water_impact
      t.integer :air_impact

      t.timestamps
    end
  end
end
