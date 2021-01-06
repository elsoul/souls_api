FirebaseIdToken.configure do |config|
  config.project_ids = ["el-quest"]
  config.redis = Redis.new
end
