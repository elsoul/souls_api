class SendSlack
  include Sidekiq::Status::Worker
  include Sidekiq::Worker
  sidekiq_options queue: "default"

  def perform text
    Slack::Ruby3.push webhook_url: ENV["WEBHOOK_URL"], message: text
  end
end
