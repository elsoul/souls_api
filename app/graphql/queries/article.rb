module Queries
  class Article < Queries::BaseQuery
    type Types::ArticleType, null: false
    argument :id, Integer, required: true

    def resolve id:
      # host = blog_host
      # stub = Souls::Blog::Stub.new(host, :this_channel_is_insecure)
      begin
        # article = stub.get_article(Souls::GetArticlRequest.new(id: id))
        # object = article.article

        # # puts proto_to(article.article)
        # Article.new(
        #   id: object.id.to_i,
        #   user_id: object.user_id.to_s,
        #   title: object.title.to_s,
        #   body: object.body.to_s,
        #   thumnail_url: object.thumnail_url.to_s,
        #   public_date: object.public_date.to_s,
        #   article_category_id: object.article_category_id.to_i,
        #   is_public: object.is_public,
        #   tag: JSON.parse(object.tag.to_json),
        #   has_series: object.has_series,
        #   series_id: object.series_id.to_i,
        #   episode_num: object.episode_num.to_i,
        #   created_at: object.created_at.to_s,
        #   updated_at: object.updated_at.to_s
        # )
        Article.new(object: nil, field: nil, context: {})
      rescue GRPC::BadStatus => e
        abort "ERROR: #{e.message}"
      end
    end

  end
end
