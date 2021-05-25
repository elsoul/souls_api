class User < ActiveRecord::Base
  has_many :article
  has_many :order_sheet

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  enum user_role: { user: 0, retailer: 1, agent: 2, staff: 3, admin: 4, master: 5 }

  # Scope
  default_scope -> { order("id") }

  def is_retailer?
    self.retailer_uid.present?
  end
end