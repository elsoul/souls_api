class Article < ApplicationRecord
  ## Relations
  belongs_to :user, validate: true
  belongs_to :article_category, validate: true

  validates :title, uniqueness: true
end
