class ChangeDateTypeOnBill < ActiveRecord::Migration[5.1]
  def change
    change_column :bills, :dos, :string
  end
end
