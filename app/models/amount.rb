class Amount < ApplicationRecord
  belongs_to :code
  belongs_to :location
end
