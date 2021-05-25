class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :article_category
  default_scope -> { order(created_at: :desc) }
end
