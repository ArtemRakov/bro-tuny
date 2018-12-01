class HouseComplex < ApplicationRecord
  has_many :houses
  belongs_to :developer

end
