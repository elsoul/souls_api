require "./app"

Dir[File.expand_path "#{Rack::Directory.new("").root}/spec/factories/*.rb"].sort.each { |file| require file }


user = FactoryBot.create(:user)
puts "User created!" if user
50000.times do |i|
  article_category = FactoryBot.create(:article_category, id: i + 1)
  puts "#{i + 1}: Article Category Created!\n #{article_category.to_json}" if article_category
rescue
  retry
end


# x = 1
# 50.times do |i|
#   case i
#     puts "#{i + 1}: Article Created!" if FactoryBot.create(:article, user_id: user.id, article_category_id: ArticleCategory.find(x).id)
#   when 1, 10, 20, 30, 40, 50
#     puts "#{i + 1}: Article Created!" if FactoryBot.create(:article, user_id: user.id, article_category_id: ArticleCategory.find(x).id)
#     x += 1
#   end
# end
