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
    @user = create(:user, :active)
    sign_in @user

    @account = create(:account)
  end

  test "assign primary user" do
    @account.primary_user = @user
    assert @account.valid?
  end

  test "assign users to an account" do
    skip "Add association from User to Account"
    user1 = create(:user, :active, account: @account)
    user2 = create(:user, :active, account: @account)
    assert @account.users_count == 2
  end
end
