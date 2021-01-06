require "./app"

Dir[File.expand_path "#{Rack::Directory.new("").root}/spec/factories/*.rb"].sort.each { |file| require file }

def create_user num
  user = FactoryBot.create(:user, id: num)
  "User created!" if user
end

def create_article_category num
  article_category = FactoryBot.create(:article_category, id: num + 1)
  "#{num + 1}: Article Category Created!\n #{article_category.to_json}" if article_category
end

def create_article user_id, article_category_id, num
  article = FactoryBot.create(:article, user_id: user_id, article_category_id: article_category_id, id: num + 1)
  "#{num + 1}: Article Created!\n #{article.to_json}" if article
end

50.times do |i|
  puts create_user(i + 1)
rescue
  retry
end

50.times do |i|
  puts create_article_category(i + 1)
rescue
  retry
end
users = User.all
article_categories = ArticleCategory.all

500.times do |i|
  user_id = users.find(rand(51).to_i + 1).id
  article_category_id = article_categories.find(rand(51).to_i + 1).id
  puts create_article(user_id, article_category_id, i)
rescue
  retry
end

