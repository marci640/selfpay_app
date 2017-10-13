class Location < ApplicationRecord
  has_many :bills
  has_many :amounts
  has_many :zipcodes
end
