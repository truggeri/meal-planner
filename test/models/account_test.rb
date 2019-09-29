# == Schema Information
#
# Table name: accounts
#
#  id           :integer          not null, primary key
#  active       :boolean          default(TRUE), not null
#  name         :string           not null
#  primary_user :bigint
#  users_count  :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require "test_helper"

class AccountTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers

  def setup
    @account = create(:account)
  end

  test "name should be shorter than 100 characters" do
    @account.name = random_characters(101)
    assert_not @account.valid?
  end

  test "name can be 100 characters" do
    @account.name = random_characters(100)
    assert @account.valid?
  end

  test "assign primary user" do
    user = create(:user, :active, account: @account)
    @account.primary_user = user
    assert @account.valid?
  end

  test "assign users to an account" do
    create(:user, :active, account: @account)
    create(:user, :active, account: @account)
    assert @account.users_count == 2
  end
end
