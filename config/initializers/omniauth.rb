Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :twitter, 'dbP3cAb2OnRX2j4QYPUXw', 'eLUlLPueG86CL8lZR9AvSHTVibE7R2ai1b275pzBek'
  provider :linkedin, '02b2ah8iu6qq', '0CYBQliZ7uDxoAyx'
  provider :google_oauth2, '731281377681.apps.googleusercontent.com', 'uybmgwP4z1Nd5b5HCDQfpydM'
  provider :yahoo, 'dj0yJmk9b01ZU0EyS2RTNlFTJmQ9WVdrOVlsTk5VVzVhTlRRbWNHbzlNVE0yTlRRME5UTTJNZy0tJnM9Y29uc3VtZXJzZWNyZXQmeD0xYg--', '21a60a5ba62f0f315d17ad26b955432b944d9214'
  provider :twitter, 'GVvHgI1rkywfUluNi0aF7Q', 'uCSPM5bcXqeFn37ppzSjiarE4YatFhOyfDswGjJSMI'
end
