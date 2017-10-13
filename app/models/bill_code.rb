class BillCode < ApplicationRecord
  belongs_to :bill 
  belongs_to :code 
end
