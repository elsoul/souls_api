require "./app"

Dir[File.expand_path "#{Rack::Directory.new("").root}/spec/factories/*.rb"].each { |file| require file }

def create_user
  user = FactoryBot.create(:user)
  "User created!\n #{user.to_json}" if user
end

def create_article_category
  article_category = FactoryBot.create(:article_category)
  "Article Category Created!\n #{article_category.to_json}" if article_category
end

def create_article user_id, article_category_id
  article = FactoryBot.create(:article, user_id: user_id, article_category_id: article_category_id)
  "Article Created!\n #{article.to_json}" if article
end

5.times do |i|
  puts create_user
end

["お知らせ", "特集", "テック", "適時開示", "レシピ"].each do |name|
  puts ArticleCategory.create(name: name)
end

users = User.all
article_categories = ArticleCategory.all

10.times do |i|
  user_id = users.find(rand(5).to_i + 1).id
  article_category_id = article_categories.find(rand(5).to_i + 1).id
  puts create_article(user_id, article_category_id)
end

