module Resolvers
  class Base < GraphQL::Schema::Resolver
    # argument_class Arguments::Base
    def decode_global_key(id)
      _, data_id = SoulsApiSchema.from_global_id id
      data_id
    end
  end
end