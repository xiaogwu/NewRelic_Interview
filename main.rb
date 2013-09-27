require "sinatra"
require "sinatra/reloader"

# Gem for sending mail
require 'mail'

# JSON parsing gem
require 'json'

# Gem used for debugging
require "pry"

# Config files for the mailer
require_relative "config/mailer"

# Some constants
require_relative "config/constants"

# API POST method
post "/send" do

  # Get data from user
  begin
    mail = JSON.parse(params.keys.first)
  rescue
    # If format is not valid (typo in giving information), return the following
    return "Sorry, mis-formed information\n"
  end

  # Make sure there are some default values
  mail["from"] ||= DEFAULT_FROM
  mail["subject"] ||= "A subject"
  mail["body"] ||= "Body"

  # Make sure destination email is in a valid format
  # otherwise replace it with the default
  mail["to"] = validate_email(mail["to"]) ? mail["to"] : DEFAULT_TO

  # Create e-mail object
  email = new_mail(mail["to"], mail["from"], mail["subject"], mail["body"])

  # Actually send the e-mail
  email.deliver

end

# Method to create a new_mail object
def new_mail(to, from, subject, body)
  # Create email object
  email = Mail.new do
    from     from
    to       to
    subject  subject
    body     body
  end

  # Explicit return, not needed
  return email
end


# A short method for validating the format of an e-mail
def validate_email(to_email)
  return nil if to_email.nil?

  # Remove name and just keep the e-mail part
  email = to_email.gsub(/.*</, "").gsub(/>.*/, "")

  # Check for the e-mail
  email =~ EMAIL_REGEX
end
