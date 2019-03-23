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
    o = [('a'..'z'), ('A'..'Z'), (0..9),].map(&:to_a).flatten
    @user.email = (0...101).map { o[rand(o.length)] }.join
    assert_not @user.valid?
  end

  test "email can be 100 characters" do
    o = [('a'..'z'), ('A'..'Z'), (0..9),].map(&:to_a).flatten
    @user.email = (0...100).map { o[rand(o.length)] }.join
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
    o = [('a'..'z'), ('A'..'Z'), (0..9),].map(&:to_a).flatten
    @user.name = (0...51).map { o[rand(o.length)] }.join
    assert_not @user.valid?
  end

  test "name can be 50 characters" do
    o = [('a'..'z'), ('A'..'Z'), (0..9),].map(&:to_a).flatten
    @user.name = (0...50).map { o[rand(o.length)] }.join
    assert @user.valid?
  end
end
