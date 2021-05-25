module Queries
  class Article < Queries::BaseQuery
    type Types::ArticleType, null: false
    argument :id, String, required: true

    def resolve **args
      _, data_id = SoulsApiSchema.from_global_id args[:id]
      ::Article.find(data_id)
    rescue StandardError => error
      GraphQL::ExecutionError.new error
    end
  end
end
