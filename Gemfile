source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'jquery-rails'

#Authentication
gem 'devise'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-linkedin'
gem 'omniauth-google-oauth2'
gem 'omniauth-yahoo'

gem 'pry'

# gem 'high_voltage'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer'
  gem 'less-rails'
  gem 'twitter-bootstrap-rails'
end

group :test, :cucumber, :development do
  gem 'rspec-rails',      ">= 2.0.0.beta"
  gem 'mocha', :require => false
  gem 'factory_girl'
  gem 'database_cleaner'
  gem 'cucumber-rails'
end

group :cucumber, :development do
  gem 'capybara'
  gem 'cucumber'
  gem 'spork'
  gem 'launchy'    # So you can do Then show me the page
end  
