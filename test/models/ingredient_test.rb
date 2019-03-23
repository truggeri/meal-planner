require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  def setup
    @ingredient = Ingredient.new(
      name: "Garlic",
      description: "A single clove of garlic",
      fresh: true)
  end

  test "should be valid" do
    assert @ingredient.valid?
  end

  test "name should be present" do
    @ingredient.name = "     "
    assert_not @ingredient.valid?
  end

  test "name should be shorter than 50 characters" do
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    @ingredient.name = (0...51).map { o[rand(o.length)] }.join
    assert_not @ingredient.valid?
  end

  test "name can be 50 characters" do
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    @ingredient.name = (0...50).map { o[rand(o.length)] }.join
    assert @ingredient.valid?
  end

  test "name should be unique" do
    second_ingredient = Ingredient.new(
      name: "Garlic",
      description: "This shouldn't work",
      fresh: true)
    @ingredient.save
    assert_not second_ingredient.valid?
  end

  test "description should be present" do
    @ingredient.description = "     "
    assert_not @ingredient.valid?
  end

  test "description should be shorter than 200 characters" do
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    @ingredient.description = (0...201).map { o[rand(o.length)] }.join
    assert_not @ingredient.valid?
  end

  test "description can be 200 characters" do
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    @ingredient.description = (0...200).map { o[rand(o.length)] }.join
    assert @ingredient.valid?
  end

  test "fresh defaults to false" do
    @ingredient.fresh = nil
    assert_not @ingredient.fresh
  end
end
