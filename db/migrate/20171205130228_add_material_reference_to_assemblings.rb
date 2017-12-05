class AddMaterialReferenceToAssemblings < ActiveRecord::Migration[5.1]
  def change
    add_reference :assemblings, :material, foreign_key: true, index: true
  end
end
