class ArticleCategory < ActiveRecord::Base
  has_many :article, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
end
