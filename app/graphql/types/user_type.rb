module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: false
    field :email, String, null: false
    field :memberships, [Types::MembershipType], null: true
    field :transactions, [Types::TransactionType], null: true
  end
end
