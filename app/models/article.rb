class Article < ActiveRecord::Base
  ## Relations
  belongs_to :user
  belongs_to :article_category
end
