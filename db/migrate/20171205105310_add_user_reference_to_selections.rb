class AddUserReferenceToSelections < ActiveRecord::Migration[5.1]
  def change
    add_reference :selections, :user, foreign_key: true, index: true
  end
end
