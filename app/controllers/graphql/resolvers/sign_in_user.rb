class Resolvers::SignInUser < GraphQL::Function
  argument :email, !Types::AuthProviderEmailInput

  # defines inline return type for the mutation
  type do
    name 'SigninPayload'

    field :token, types.String
    field :user, Types::UserType
  end

  def call(_obj, args, _ctx)
    input = args[:email]

    # basic validation
    return unless input

    user = User.find_by email: input[:email]

    # ensures we have the correct user
    return unless user
    return unless user.authenticate(input[:password])

    token = JWT.encode({user_id: user.id}, 'Rails.application.secrets.secret_key_base', 'HS256')

    OpenStruct.new({
      user: user,
      token: token
    })
  end
end
