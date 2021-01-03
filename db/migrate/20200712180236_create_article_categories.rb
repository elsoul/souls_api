class CreateArticleCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :article_categories do |t|
      t.string :name, null: false
      t.integer :total_articles, default: 0
      t.text :tag, array: true, default: []

      t.timestamps
    end
  end
end
