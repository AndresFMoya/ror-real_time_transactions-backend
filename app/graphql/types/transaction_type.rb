module Types
  class TransactionType < Types::BaseObject
    field :amount, Float, null: false
    field :description, String, null: false
  end
end
