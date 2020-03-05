module Mutations
  class CreateUser < BaseMutation
    argument :username, String, required: true
    argument :email, String, required: true
    argument :password_digest, String, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(username: nil, email: nil, password_digest: nil)
      user = User.new(
          username: username,
          email: email,
          password_digest: password_digest
      )
      if user.save
        { user: user }
      else
        { errors: user.errors.full_messages }
      end
    end
  end
end