require 'coveralls'
Coveralls.wear!('rails')

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require 'simplecov'
# NOTE-truggeri-20190323 Exempting these as there's no code in them yet
EXEMPT_CLASSES = %w[channels jobs mailers].freeze
SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::HTMLFormatter])
SimpleCov.start 'rails' do
  EXEMPT_CLASSES.each { |dir| add_filter "app/#{dir}/" }
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def random_characters(length = 20)
    return nil if length < 1
    o = [('a'..'z'), ('A'..'Z'), (0..9),].map(&:to_a).flatten
    (0..length-1).map { o[rand(o.length)] }.join
  end  
end
