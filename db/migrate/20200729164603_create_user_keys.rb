class CreateUserKeys < ActiveRecord::Migration[6.0]
  def change
    create_table :user_keys do |t|
      t.references :user, type: :string
      t.references :key_group, null: false, foreign_key: true
      t.text :key

      t.timestamps
    end
  end
end
