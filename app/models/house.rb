class House < ApplicationRecord
  has_many :stages
  has_many :users
  belongs_to :house_complex
end
