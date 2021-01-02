class ArticleCategory < ApplicationRecord
  has_many :article, dependent: :destroy
  validates :name, uniqueness: true
end
