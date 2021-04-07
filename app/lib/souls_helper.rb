module SoulsHelper
  def self.slack_error text
    Slack::Ruby3.push webhook_url: ENV["SLACK"], message: text
  end

  def self.get_tables
    path = "./db/schema.rb"
    tables = []
    File.open(path, "r") do |f|
      f.each_line.with_index do |line, i|
        tables << line.split("\"")[1] if line.include?("create_table")
      end
    end
    tables
  end

  def self.zipcode_ja
    file_path = "./db/seed_csv/zipcode.txt"
    zipcodes = File.open(file_path, "r").map { |n| n }
    zipcodes.sample.strip
  end
end