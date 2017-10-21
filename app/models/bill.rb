class Bill < ApplicationRecord
  has_many :bill_codes
  has_many :codes, through: :bill_codes
  belongs_to :location
   

end
