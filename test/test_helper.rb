ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
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
