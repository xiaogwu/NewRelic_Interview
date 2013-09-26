require "sinatra"
require "sinatra/reloader"

# JSON parsing gem
require 'json'

# Gem used for debugging
require "pry"

# API POST method
post "/send" do

  # Gem to send an email
  require "pony"

  # Create a mail oject fromm the params sent
  mail = JSON.parse(params.keys.first)


  # Make sure there are some default values
  mail[:to] ||= "frankywahl@gmail.com"
  mail[:from] ||= "frankywahl@gmail.com"
  mail[:subject] ||= "A subject"
  mail[:body] ||= "Body"

  Pony.mail({
    to: mail[:to],
    from: mail[:from],
    subject: mail[:subject],
    body: mail[:body]
  })




end
