# == Schema Information
#
# Table name: recipes
#
#  id              :integer          not null, primary key
#  description     :text(500)        not null
#  minutes_to_make :integer
#  name            :string(50)       not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint           not null
#

require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @recipe = create(:recipe)
  end

  test "should be valid" do
    assert @recipe.valid?
  end

  test "name should be present" do
    @recipe.name = "     "
    assert_not @recipe.valid?
  end

  test "name should be shorter than 50 characters" do
    @recipe.name = random_characters(51)
    assert_not @recipe.valid?
  end

  test "name can be 50 characters" do
    @recipe.name = random_characters(50)
    assert @recipe.valid?
  end

  test "name should be unique" do
    second_recipe = build(:recipe, name: @recipe.name)
    assert_not second_recipe.valid?
  end

  test "description should be present" do
    @recipe.description = "     "
    assert_not @recipe.valid?
  end

  test "description should be shorter than 500 characters" do
    @recipe.description = random_characters(501)
    assert_not @recipe.valid?
  end

  test "description can be 500 characters" do
    @recipe.description = random_characters(500)
    assert @recipe.valid?
  end

  test "minutes_to_make cannot be nil" do
    @recipe.minutes_to_make = nil
    assert_not @recipe.valid?
  end

  test "minutes_to_make greater than zero" do
    @recipe.minutes_to_make = 0
    assert_not @recipe.valid?
  end

  test "minutes_to_make less than 1440" do
    @recipe.minutes_to_make = 1440
    assert_not @recipe.valid?
  end
end
