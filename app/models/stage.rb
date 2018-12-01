class Stage < ApplicationRecord
  belongs_to :house

  enum status: [ :kappa, :not_started, :active, :done  ]

end
