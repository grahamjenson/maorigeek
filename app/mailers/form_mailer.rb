class FormMailer < ActionMailer::Base
  default from: "contact-form@maori.geek.nz"

  def contact_form_mail(params)
    mail(to: 'enquiry@maori.geek.nz', subject: 'Contact Form Site')
  end

end
