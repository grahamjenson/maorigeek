class PersonMailer < ActionMailer::Base
  default from: "info@maori.geek.nz"

  def authenticate_email(person)
    @person = person
    mail(to: @person.email, subject: 'Email Confirmation for Maori Geek')
  end

end
