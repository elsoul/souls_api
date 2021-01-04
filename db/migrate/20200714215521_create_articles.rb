class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user
      t.string :title, null: false
      t.text :body, null: false
      t.string :thumnail_url, null: false
      t.datetime :public_date, null: false
      t.references :article_category, null: false
      t.boolean :is_public, default: false
      t.text :tag, array: true, default: []

      t.timestamps
    end
    add_index :articles, :title
    add_index :articles, :is_public
  end
end
