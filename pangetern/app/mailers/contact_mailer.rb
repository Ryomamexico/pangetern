class ContactMailer < ActionMailer::Base
  default from: "#{@contact}"   # 送信元アドレス
  default to: "ryomamexico228@gmail.com"     # 送信先アドレス
 
  def received_email(contact)
    @contact = contact
    mail(:subject => 'お問い合わせを承りました')
  end
end