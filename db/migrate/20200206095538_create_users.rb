class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: false  do |t|
      t.string :id, primary_key: true
      t.string :username
      t.string :screen_name
      t.string :email
      t.string :icon_url
      t.string :birthday
      t.string :lang
      t.integer :roles_mask
      t.integer :total_articles, default: 0
      t.integer :total_tweets, default: 0
      t.integer :gem

      t.timestamps
    end
    add_index :users, :screen_name
    add_index :users, :email
    add_index :users, :username
  end
end
