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
end