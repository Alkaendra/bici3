class Info < MailForm::Base
  attribute :nombre,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :tema
  attribute :mensaje
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => %(#{tema}),
      :to => "bicicleteavaldespartera@gmail.com",
      :from => %("#{nombre}" <#{email}>)
    }
  end
end
