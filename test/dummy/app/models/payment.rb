class Payment < ApplicationRecord
  belongs_to :user

  enum pay_type: {
    card: 0,
    cash: 1
  }
end
