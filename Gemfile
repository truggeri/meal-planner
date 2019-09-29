source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.2"

gem "puma", "~> 3.11"
gem "rails", "~> 6.0.0"
gem "sass-rails", "~> 5.0"
gem "sqlite3", "~> 1.4"
gem "uglifier", ">= 1.3.0"
gem "webpacker"

# third-party gems
gem "bootsnap", ">= 1.4.5", require: false
gem "bootstrap", "~> 4.3.1"
gem "devise"
gem "jbuilder", "~> 2.5"
gem "turbolinks", "~> 5"

group :development, :test do
  gem "byebug", "~> 10.0.2", platforms: %i[mri mingw x64_mingw]
  gem "coveralls", require: false
  gem "ffaker"
  gem "simplecov", require: false
end

group :development do
  gem "annotate"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "pry"
  gem "spring", "~> 2.0.2"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "factory_bot"
  gem "rubocop"
  gem "rubocop-performance"
end
