class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Person < ActiveRecord::Base

  before_save :create_authentication_token, :if => :email_changed?

  after_commit :send_authentication_email

  validates :email, :presence => true, :email => true, uniqueness: true

  def create_authentication_token
    self.authentication_token = SecureRandom.hex(8)
  end

  def send_authentication_email
    PersonMailer.authenticate_email(self).deliver
  end
end
