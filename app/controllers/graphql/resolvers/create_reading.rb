class Resolvers::CreateReading < GraphQL::Function
  argument :title, !types.String
  #argument :description, !types.String

  type Types::ReadingType

  def call(_obj, args, ctx)
    Reading.create!(
      title: args[:title],
      user: ctx[:current_user]
    )
  end
end
