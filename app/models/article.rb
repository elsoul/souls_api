class Article < ActiveRecord::Base
  ## Relations
  belongs_to :user, validate: true
  belongs_to :article_category, validate: true
end
