module SoulsHelper
  yml_path = "./config/column_names.yml"
  COLUMNS = YAML.safe_load_file yml_path
  def self.export_csv model_name
    singularized_name = model_name.singularize.underscore
    return "Please Set ./config/column_names.yml !" unless COLUMNS[singularized_name]
    return "Columns number doesn't match! Please check ./config/column_names.yml !" unless COLUMNS[singularized_name].size == Object.const_get(singularized_name.camelize).column_names.size
    file_path = ENV["RACK_ENV"] == "production" ? "./db/seed_csv/#{model_name.pluralize.underscore}_production.csv" : "./db/seed_csv/#{model_name.pluralize.underscore}.csv"
    CSV.open(file_path, "w") do |csv|
      csv << Object.const_get(singularized_name.camelize).column_names.map { |c| COLUMNS[singularized_name][c] }
      Object.const_get(singularized_name.camelize).all.reverse.each do |item|
        csv << item.attributes.values
      end
    end
    "export success!:#{file_path}"
  rescue StandardError => error
    error.backtrace
  end

  def self.export_model_to_csv model_name
    singularized_name = model_name.singularize.underscore
    pluralized_name = model_name.pluralize.underscore
    time = Time.now.strftime("%F-%H-%M-%S")
    file_name = "#{pluralized_name}-#{time}.csv"
    upload_path = "csv/#{singularized_name}/#{file_name}"
    file_path = "./tmp/#{pluralized_name}-#{time}.csv"
    class_name = Object.const_get(singularized_name.camelize)
    CSV.open(file_path, "w") do |csv|
      if COLUMNS[singularized_name].present?
        return "Columns number doesn't match! Please check ./config/column_names.yml !" unless COLUMNS[singularized_name].size == Object.const_get(singularized_name.camelize).column_names.size
        csv << class_name.column_names.map { |c| COLUMNS[singularized_name][c] }
      else
        csv << class_name.column_names
      end
      class_name.all.reverse.each do |item|
        csv << item.attributes.values
      end
    end
    self.upload_to_gcs file_path, upload_path
    FileUtils.rm file_path
    "https://storage.cloud.google.com/#{ENV["GCS_NAME"]}/csv/#{singularized_name}/#{file_name}"
  rescue StandardError => error
    error.backtrace
  end

  def self.upload_to_gcs(file_path, upload_path)
    storage = Google::Cloud::Storage.new
    bucket_path = ENV["RACK_ENV"] == "production" ? ENV["GCS_NAME_PRODUCTION"] : ENV["GCS_NAME_DEV"]
    bucket = storage.bucket bucket_path
    file = bucket.create_file file_path, upload_path, acl: "authenticated_read"
    file.public_url
  rescue StandardError => error
    raise StandardError, error
  end

  def self.pubsub_queue topic_name: "seino-schedule-scraper", message: "text!"
    pubsub = Google::Cloud::Pubsub.new project: ENV["PROJECT_ID"]
    topic = pubsub.topic topic_name
    topic.publish message
  end

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