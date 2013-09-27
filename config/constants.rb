EMAIL_REGEX = /^[+_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]
  +(\.[a-zA-Z0-9-]+)*\.(([0-9]{1,3})|([a-zA-Z]{2,3})
    |(aero|coop|info|museum|name))$/xi


DEFAULT_FROM = "Somebody <noreply@example.com>"
DEFAULT_TO = "Someone Else <#{ENV['GMAIL_USER']}@gmail.com>"
