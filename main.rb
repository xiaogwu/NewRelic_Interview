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

# API POST method
post "/send" do

  # Get data from user
  mail = JSON.parse(params.keys.first)


  # Make sure there are some default values
  mail["to"] ||= "Franky W. <frankywahl@gmail.com>"
  mail["from"] ||= "Somebody <noreply@example.com>"
  mail["subject"] ||= "A subject"
  mail["body"] ||= "Body"

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
