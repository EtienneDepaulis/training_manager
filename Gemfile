source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '5.0.0.rc1'
gem 'pg'

gem 'uglifier'

gem 'sass-rails'
gem 'coffee-rails'

# External assets
source 'https://rails-assets.org' do
  gem 'rails-assets-jquery'
  gem 'rails-assets-jquery-ujs'
  gem 'rails-assets-jquery-ui'
  gem 'rails-assets-bootstrap'
  gem 'rails-assets-bootstrap-switch'
  gem 'rails-assets-moment'
  gem 'rails-assets-bootstrap3-datetimepicker'
  gem 'rails-assets-select2'
  gem 'rails-assets-select2-bootstrap3-css'
end

gem 'responders', '~> 2.0'

gem 'rails-i18n'

gem 'newrelic_rpm'

gem 'icalendar'

# Forms
gem 'simple_form'

group :development do
  gem 'spring'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'guard-rspec'
  gem 'pry-rails'
end

group :test do
  gem 'rack-test'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'shoulda-matchers', require: false
  gem 'capybara'
end

gem 'puma'

group :production do
  gem 'rails_12factor'
  gem 'heroku-deflater'
end