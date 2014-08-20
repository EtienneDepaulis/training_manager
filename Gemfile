source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '4.1.4'
gem 'pg'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

gem 'active_model_serializers'

gem "rack-cors", :require => "rack/cors"

gem 'rails-i18n', '~> 4.0.0'

gem 'newrelic_rpm'

gem 'airbrake'

gem 'icalendar'

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