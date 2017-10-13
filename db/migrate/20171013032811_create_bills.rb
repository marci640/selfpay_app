class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.integer :location_id
      t.date :dos
      t.string :hospital

      t.timestamps
    end
  end
end
