require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name:   "Tommy Testo",
      email:  "tommy@testo.net",
      active: true)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "user has email" do
    @user.email = "  "
    assert_not @user.save
  end

  test "email should be shorter than 100 characters" do
    @user.email = random_characters(101)
    assert_not @user.valid?
  end

  test "email can be 100 characters" do
    @user.email = random_characters(100)
    assert @user.valid?
  end

  test "email should be unique" do
    second_user = User.new(
      name: "Todd Testo",
      email: "tommy@testo.net",
      active: true)
    @user.save
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
