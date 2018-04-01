Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :allReadings, !types[Types::ReadingType] do
    # resolve would be called in order to fetch data for that field
    resolve -> (obj, args, ctx) { Reading.where(user_id: ctx[:current_user]) }
  end

end
