class CreateZipcodes < ActiveRecord::Migration[5.1]
  def change
    create_table :zipcodes do |t|
      t.integer :location_id
      t.string :code

      t.timestamps
    end
  end
end
