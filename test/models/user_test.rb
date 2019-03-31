# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  active                 :boolean          default(TRUE), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string(50)       not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = create(:user)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "user has email" do
    @user.email = "  "
    assert_not @user.save
  end

  test "email should be unique" do
    second_user = build(:user, email: @user.email)
    assert_not second_user.valid?
  end

  test "user has name" do
    @user.name = "  "
    assert_not @user.save
  end

  test "name should be shorter than 50 characters" do
    @user.name = random_characters(51)
    assert_not @user.valid?
  end

  test "name can be 50 characters" do
    @user.name = random_characters(50)
    assert @user.valid?
  end
end
