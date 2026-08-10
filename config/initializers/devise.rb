require "devise/orm/active_record"

Devise.setup do |config|
  config.mailer_sender = "please-change-me@example.com"
  config.secret_key = Rails.application.credentials.secret_key_base
  config.remember_for = 2.weeks
  config.password_length = 6..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
