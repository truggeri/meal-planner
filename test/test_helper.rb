require 'coveralls'
Coveralls.wear!('rails')

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def random_characters(length = 20)
    return nil if length < 1
    o = [('a'..'z'), ('A'..'Z'), (0..9),].map(&:to_a).flatten
    (0..length-1).map { o[rand(o.length)] }.join
  end  
end
