class Contact < MailForm::Base
  attribute :name, :validate => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :subject
  attribute :message

  def headers
    {
      :subject => 'My Contact Form',
      :to => "ryomamexico228@gmail.com",
      :from => %("#{name}":<#{email}>から#{subject}というメールを受信しました！)
    }
  end
end