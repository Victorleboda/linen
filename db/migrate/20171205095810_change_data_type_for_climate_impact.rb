# frozen_string_literal: true

class ChangeDataTypeForClimateImpact < ActiveRecord::Migration[5.1]
  def change
    change_column :materials, :climate_impact, :float
    change_column :materials, :water_impact, :float
    change_column :materials, :air_impact, :float
  end
end
