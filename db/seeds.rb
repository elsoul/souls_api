require "factory_bot"
require "faker"
require "./spec/factories/users"
require "./spec/factories/article_categories"
puts "User created!" if FactoryBot.create(:user)
puts "Article Category created!" if FactoryBot.create(:article_category)
# 50.times do |i|
#   puts "#{i}: Article Created!"
# end
