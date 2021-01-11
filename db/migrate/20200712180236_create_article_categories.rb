class CreateArticleCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :article_categories do |t|
      t.string :name, null: false
      t.text :tag, array: true, default: []

      t.timestamps
    end
    add_index :article_categories, :name
  end
end
