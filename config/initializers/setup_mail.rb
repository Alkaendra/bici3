ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "asemar@gmail.com", #Your user name
  :password             => "primojavi", # Your password
  :authentication       => "plain",
  :enable_starttls_auto => true
}
#configure gmail
#https://www.google.com/settings/security/lesssecureapps
