class InquiryMail
  include Sidekiq::Status::Worker
  include Sidekiq::Worker
  include SendGrid
  sidekiq_options queue: "default"

  def perform **args
    email = "info@mail.com"
    html = ERB.new(
      "本文"
    )
    from = SendGrid::Email.new(email: ENV["ADMIN_EMAIL"])
    to = SendGrid::Email.new(email: email)
    subject = "タイトル"
    content = SendGrid::Content.new(type: "text/html", value: html.result)
    mail = SendGrid::Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV["SENDGRID_KEY"] || "")
    response = sg.client.mail._("send").post(request_body: mail.to_json)
    puts response.status_code
  end
end
