class AddItemReferenceToAssemblings < ActiveRecord::Migration[5.1]
  def change
    add_reference :assemblings, :item, foreign_key: true, index: true
  end
end
