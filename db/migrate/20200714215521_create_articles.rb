class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user
      t.string :title, null: false, unique: true
      t.text :body, null: false, default: ""
      t.string :thumnail_url, null: false, default: ""
      t.datetime :public_date, null: false, default: DateTime.now + 3000
      t.references :article_category, null: false
      t.boolean :is_public, default: false, null: false
      t.boolean :just_created, default: true, null: false
      t.string :slag, null: false, unique: true
      t.text :tags, array: true, default: []
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end
    add_index :articles, :slag, unique: true
    add_index :articles, :title, unique: true
    add_index :articles, :is_public
  end
end
