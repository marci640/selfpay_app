class CreateAmounts < ActiveRecord::Migration[5.1]
  def change
    create_table :amounts do |t|
      t.integer :code_id
      t.integer :location_id
      t.decimal :facility_fee, precision: 11, scale: 2
      t.decimal :non_facility_fee, precision: 11, scale: 2

      t.timestamps
    end
  end
end
