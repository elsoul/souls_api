class User < ActiveRecord::Base
  has_many :article, dependent: :destroy
end
