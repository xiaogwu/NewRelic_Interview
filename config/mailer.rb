Mail.defaults do
  delivery_method :smtp, {
      address: "smtp.gmail.com",
      port: 587,
      domain: "frankywahl.newrelic.com",
      authentication: "plain",
      enable_starttls_auto: true,
      user_name: ENV['GMAIL_USER'],
      password: ENV["GMAIL_PASS"]
  }
end
