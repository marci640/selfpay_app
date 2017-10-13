class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :carrier
      t.string :locality

      t.timestamps
    end
  end
end
