class User < ApplicationRecord
  before_save :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  # Scope
  default_scope -> { order("created_at") }

  private

  def downcase_email
    self.email = email.downcase
  end
end
