source 'https://rubygems.org'
source 'https://rails-assets.org'

ruby '2.2.1'

gem 'rails', '4.2.0'
gem 'pg'

gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.0'

gem 'sass-rails', '~> 4.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'turbolinks'

# External assets
gem 'rails-assets-jquery', '2.1.3'
gem 'rails-assets-jquery-ujs', '1.0.3'
gem 'rails-assets-jquery-ui', '1.11.2'
gem 'rails-assets-bootstrap', '3.3.4'
gem 'rails-assets-bootstrap-switch', '3.3.2'
gem 'rails-assets-select2', '3.5.2'
gem 'rails-assets-select2-bootstrap3-css', '1.4.4'

gem 'responders', '~> 2.0'

gem 'active_model_serializers', '~>0.9.3'

gem "rack-cors", require: "rack/cors"

gem 'rails-i18n', '~> 4.0.0'

gem 'newrelic_rpm'

gem 'airbrake'

gem 'icalendar'

# Models
gem 'draper'

# Forms
gem 'simple_form'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 0.4.0'
end

group :development do
  gem 'spring'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'spring-commands-rspec'
  gem 'guard-rspec'
  gem 'pry-rails'
end

group :test do
  gem 'rack-test'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'shoulda-matchers', require: false
end

group :production do
  gem 'unicorn'
  gem 'rails_12factor'
  gem 'heroku-deflater'
end