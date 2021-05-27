module Types
  class MutationType < Types::BaseObject
    SoulsHelper.get_tables.each do |t|
      ["create", "update", "delete", "destroy_delete"].each do |a|
        field "#{a}_#{t.singularize.underscore}".to_sym, mutation: Object.const_get("Mutations::#{t.singularize.camelize}::#{a.camelize}#{t.singularize.camelize}")
      end
    end
  end
end