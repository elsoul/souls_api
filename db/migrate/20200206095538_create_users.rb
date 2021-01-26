class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :uid, null: false, unique: true
      t.string :username
      t.string :screen_name
      t.string :email, null: false, unique: true
      t.string :tel
      t.string :icon_url
      t.string :birthday
      t.string :lang
      t.integer :roles_mask, null: false, default: 1

      t.timestamps
    end
    add_index :users, :uid
    add_index :users, :screen_name
    add_index :users, :email
    add_index :users, :username
  end
end
