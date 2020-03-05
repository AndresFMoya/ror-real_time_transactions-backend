module Types
  class SubscriptionType < Types::BaseObject
    field :newUser, Types::UserType, null: false, description: 'A new user'
    field :newGroup, Types::UserType, null: false, description: 'A new group'

    def new_user; end

    def new_group; end
  end
end
