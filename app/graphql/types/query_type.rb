module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false
    field :groups, [Types::GroupType], null: false
    field :me, Types::UserType, null: true

    def me
      context[:current_user]
    end

    def users
      User.all
    end

    def groups
      Group.all
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end
  end
end
