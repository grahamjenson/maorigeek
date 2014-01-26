class FormMailer < ActionMailer::Base
  default from: "contact-form@maori.geek.nz"

  def contact_form_mail(params)
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    mail(to: 'enquiry@maori.geek.nz', subject: 'Contact Form Site')
  end

end
