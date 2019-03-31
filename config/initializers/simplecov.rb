# https://stackoverflow.com/questions/35476814/simplecov-calculate-0-coverage-for-user-model

if ENV['RAILS_ENV'] == 'test'
  require 'simplecov'
  require 'coveralls'
  # NOTE-truggeri-20190323 Exempting these as there's no code in them yet
  EXEMPT_CLASSES = %w[channels jobs mailers].freeze
  SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ])
  SimpleCov.start 'rails' do
    EXEMPT_CLASSES.each { |dir| add_filter "app/#{dir}/" }
  end
end