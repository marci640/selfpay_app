class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :credential, :phone, :address_1, :city, :state, :zipcode, :specialty, presence: true 
end
