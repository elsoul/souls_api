class User < ActiveRecord::Base
  include RoleModel
  has_many :article, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  roles :user, :retailer, :agent, :staff, :admin, :master

  before_create :assign_initial_roles

  # Scope
  default_scope -> { order("id") }

  def assign_initial_roles
    roles << [:user]
  end
end
