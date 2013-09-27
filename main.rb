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
  mail = JSON.parse(params.keys.first)

  # Make sure there are some default values
  mail["from"] ||= DEFAULT_FROM
  mail["subject"] ||= "A subject"
  mail["body"] ||= "Body"

  # Make sure destination email is in a valid format
  mail["to"] = validate_email(mail["to"]) ? mail["to"] : DEFAULT_TO

  # Create email object
  email = Mail.new do
    from     mail["from"]
    to       mail["to"]
    subject  mail["subject"]
    body     mail["body"]
  end

  # Actually send the e-mail
  email.deliver

end


# A short method for validating the format of an e-mail
def validate_email(to_email)
  return nil if to_email.nil?

  # Remove name and just keep the e-mail part
  email = to_email.gsub(/.*</, "").gsub(/>.*/, "")

  # Check for the e-mail
  email =~ EMAIL_REGEX
end
