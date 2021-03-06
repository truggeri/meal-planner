# NOTE-truggeri-20190407
#  Since using devise, coveralls has gone bananas and has become wildly inconsistent.
#  Abandoning for now as it's more trouble than it's worth. Issues _related_ to,
#  https://github.com/colszowka/simplecov/issues/599

require "simplecov"
# NOTE-truggeri-20190323 Exempting these as there's no code in them yet
EXEMPT_CLASSES = %w[channels jobs mailers].freeze
SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::HTMLFormatter])
SimpleCov.start 'rails' do
  EXEMPT_CLASSES.each { |dir| add_filter "app/#{dir}/" }
end

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    include FactoryBot::Syntax::Methods
    FactoryBot.find_definitions

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    def random_characters(length)
      return nil if length < 1
      length = Random.rand(50) if length.nil?
      FFaker::Lorem.characters(length)
    end
  end
end
