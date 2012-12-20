ActionMailer::Base.smtp_settings = {
  :user_name => ENV["GMAIL_ADDRESS"],
  :password => ENV["GMAIL_PASSWORD"],
  :address => "smtp.gmail.com",
  :port => 587,
  :tls => true
}
