class Stage < ApplicationRecord
  belongs_to :house

  enum status: [ :not_started, :active, :done  ]

end
