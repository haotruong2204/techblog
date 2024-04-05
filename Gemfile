source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.8"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use mysql as the database for Active Record
gem "mysql2", "~> 0.5"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
gem "sass-rails"

group :development, :test do
  gem "pry-byebug"
  gem "pry-rails"

  # Convention
  gem "rubocop", require: false
  gem "rubocop-performance"
  gem "rubocop-rspec"
  gem "rubocop-rake"
end

group :development do
  gem "capistrano"
  gem "capistrano-rails"
  gem "capistrano-bundler"
  gem "capistrano-rvm"
  gem "capistrano3-puma"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"

end

# Environment variables
gem "dotenv-rails"

# Authentication & async send mail with devise
gem "devise"
gem "devise-async"
gem "omniauth"
gem "omniauth-rails_csrf_protection"
gem "omniauth-google-oauth2"

# Schema in model
gem "annotate"

# Render error fields
gem "simple_form"

# Strip attribute before commit
gem "strip_attributes"

# SVG
gem "nokogiri"

# Slug
gem "friendly_id", "~> 5.4.0"

# Paginate
gem "pagy", "~> 7.0"

# Search
gem "ransack"

# background jobs
gem "sidekiq", "~> 6.5", ">= 6.5.7"
gem "sidekiq-status"

# Config
gem "config"

# Editor
gem "ckeditor"
gem "mini_magick"
gem "image_processing", "~> 1.2"

# Upload file to S3 AWS
gem "aws-sdk-s3", "~> 1"
