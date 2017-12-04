class CreateAssemblings < ActiveRecord::Migration[5.1]
  def change
    create_table :assemblings do |t|
      t.integer :percent

      t.timestamps
    end
  end
end
