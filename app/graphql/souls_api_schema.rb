class SoulsApiSchema < GraphQL::Schema
  use GraphQL::Pagination::Connections

  mutation(Types::MutationType)
  query(Types::QueryType)
end
