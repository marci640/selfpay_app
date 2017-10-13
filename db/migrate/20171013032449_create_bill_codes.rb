class CreateBillCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :bill_codes do |t|
      t.integer :bill_id
      t.integer :code_id
      t.decimal :amt_billed, precision: 11, scale: 2

      t.timestamps
    end
  end
end
