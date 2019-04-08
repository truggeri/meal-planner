source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.2'
gem 'sass-rails', '~> 5.0'
gem 'sqlite3', '~> 1.3.13'
gem 'uglifier', '>= 1.3.0'

# third-party gems
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~> 4.3.1'
gem 'coffee-rails', '~> 4.2'
gem 'coveralls', require: false
gem 'devise'
gem 'factory_bot'
gem 'ffaker'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'

group :development, :test do
  gem 'byebug', '~> 10.0.2', platforms: %i[mri mingw x64_mingw]
  gem 'simplecov', require: false
end

group :development do
  gem 'annotate'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'solargraph', require: false
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver', '~> 3.141.0'
end

gem 'tzinfo-data', '~> 1.2.5', platforms: %i[mingw mswin x64_mingw jruby]
