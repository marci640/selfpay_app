class Code < ApplicationRecord
  has_many :bill_codes
  has_many :amounts
end
