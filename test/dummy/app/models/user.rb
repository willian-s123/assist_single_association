class User < ApplicationRecord
  has_one :payment, dependent: :destroy

  extend AssistSingleAssociation
end
