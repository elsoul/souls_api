class UserKey < ApplicationRecord
  ## Relation
  belongs_to :user
  belongs_to :key_group

  ## Validations
  validates :user_id,
            uniqueness: {
              message: "同じ組み合わせのレコードが既に存在します。",
              scope: %i[key_group_id]
            }


  before_create do
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
    token = crypt.encrypt_and_sign(self.key)
    self.key = token if self.key
  end

  def self.tw_consumer_key user_id: ENV["MYUID"]
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
    token = UserKey.find_by(user_id: user_id, key_group_id: 1).key
    crypt.decrypt_and_verify token
  end

  def self.tw_consumer_secret user_id: ENV["MYUID"]
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
    token = UserKey.find_by(user_id: user_id, key_group_id: 2).key
    crypt.decrypt_and_verify token
  end

  def self.tw_access_token user_id: ENV["MYUID"]
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
    token = UserKey.find_by(user_id: user_id, key_group_id: 3).key
    crypt.decrypt_and_verify token
  end

  def self.tw_access_token_secret user_id: ENV["MYUID"]
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
    token = UserKey.find_by(user_id: user_id, key_group_id: 4).key
    crypt.decrypt_and_verify token
  end
end
