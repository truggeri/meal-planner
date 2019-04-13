# == Schema Information
#
# Table name: ingredients
#
#  id          :integer          not null, primary key
#  description :text(200)        not null
#  fresh       :boolean          default(FALSE), not null
#  name        :string(50)       not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  account_id  :bigint
#

require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  def setup
    @ingredient = create(:ingredient)
  end

  test "should be valid" do
    assert @ingredient.valid?
  end

  test "name should be present" do
    @ingredient.name = "     "
    assert_not @ingredient.valid?
  end

  test "name should be shorter than 50 characters" do
    @ingredient.name = random_characters(51)
    assert_not @ingredient.valid?
  end

  test "name can be 50 characters" do
    @ingredient.name = random_characters(50)
    assert @ingredient.valid?
  end

  test "name should be unique" do
    second_ingredient = build(:ingredient, name: @ingredient.name)
    assert_not second_ingredient.valid?
  end

  test "description should be present" do
    @ingredient.description = "     "
    assert_not @ingredient.valid?
  end

  test "description should be shorter than 200 characters" do
    @ingredient.description = random_characters(201)
    assert_not @ingredient.valid?
  end

  test "description can be 200 characters" do
    @ingredient.description = random_characters(200)
    assert @ingredient.valid?
  end

  test "fresh defaults to false" do
    @ingredient.fresh = nil
    assert_not @ingredient.fresh
  end
end
