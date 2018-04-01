Types::ReadingType = GraphQL::ObjectType.define do
  name 'Reading'

  field :id, !types.ID
  field :title, !types.String
  #field :description, !types.String
  field :createdBy, -> { Types::UserType }, property: :user
end
