class User < ActiveRecord::Base
  has_many :user_key, dependent: :destroy
end
