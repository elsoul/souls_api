module Types
  class BaseConnection < GraphQL::Types::Relay::BaseConnection
    field :total_count, Integer, null: false
    field :total_pages, Integer, null: false
    # field :current_page, Integer, null: false

    def total_count
      object.items.size
    end

    def total_pages
      total_count / object.max_page_size + 1
    end

    # def current_page
    #   page_size = object.first if object.respond_to?(:first)
    #   page_size ||= object.max_page_size
    #   skipped = object.arguments[:skip] || 0
    #   (skipped / page_size) + 1
    # end
  end
end