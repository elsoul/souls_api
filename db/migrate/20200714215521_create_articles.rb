class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles, id: false do |t|
      t.string :id, primary_key: true
      t.references :user, type: :string
      t.string :title, null: false
      t.text :body, null: false
      t.string :thumnail_url, null: false
      t.integer :public_date, null: false
      t.string :article_category, null: false
      t.boolean :is_public, default: false
      t.text :tag, array: true, default: []
      t.integer :created_at, null: false, default: 0
      t.integer :updated_at, null: false, default: 0
    end
  end
end
