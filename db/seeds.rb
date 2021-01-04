Dir[File.expand_path "#{Rack::Directory.new("").root}/spec/factories"].sort.each { |file| require file }

user = FactoryBot.create(:user)
puts "User created!" if user
article_category = FactoryBot.create(:article_category)
puts "Article Category created!" if article_category
50.times do |i|
  puts "#{i}: Article Created!" if FactoryBot.create(:article, user_id: user.id, article_category_id: article_category.id)
end
