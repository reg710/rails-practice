class ApplicationMailer < ActionMailer::Base
  # This would need to be replaced with a real email if using in production
  default from: "from@example.com"
  layout "mailer"
end
