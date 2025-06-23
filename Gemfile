# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.1'
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 6.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 5'
# Background jobs adapter
gem 'sidekiq'
# Lightweight job scheduler extension for Sidekiq
gem 'sidekiq-scheduler'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# Managing ENV variables
gem 'dotenv-rails'

# Ruby state machines
gem 'aasm'
# An opinionated framework for creating REST-like APIs in Ruby
gem 'grape'
# An API focused facade that sits on top of an object model
gem 'grape-entity'
# Implementation of a Service Object
gem 'single_action_service'

# Provides SSL, TLS and general purpose cryptography.
gem 'openssl'

group :development, :test do
  #  Ruby fast debugger
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # factory_bot is a fixtures replacement with a straightforward definition syntax
  gem 'factory_bot_rails'
  # Easily generate fake data
  gem 'faker'
  # RSpec for Rails
  gem 'rspec-rails'
  # Collection cardinality matchers, extracted from rspec-expectations
  gem 'rspec-collection_matchers'
  # Automatic Rails code style checking tool
  gem 'rubocop-rails', require: false
end

group :development do
  gem 'listen'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
