class AddNotationToMaterials < ActiveRecord::Migration[5.1]
  def change
    add_column :materials, :climate_notation, :integer
    add_column :materials, :air_notation, :integer
    add_column :materials, :water_notation, :integer
  end
end
