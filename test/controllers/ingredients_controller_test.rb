require "test_helper"

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @i = create(:ingredient)
    @user = create(:user, :active)
    sign_in @user
  end

  test "should get #index" do
    get ingredients_url
    assert_response :success
    assert_select "td", @i.name
  end

  test "should get #show" do
    get ingredient_url(@i)
    assert_response :success
  end

  test "should get #new" do
    get new_ingredient_url
    assert_response :success
  end

  test "should post #create" do
    assert_difference("Ingredient.count", 1) do
      post ingredients_url params: {
        ingredient: {
          description: FFaker::Lorem.phrase,
          fresh: false,
          name: FFaker::Food.ingredient
        }
      }
      assert_response :redirect
    end
  end

  test "should error on #create when ingredient exists" do
    assert_no_difference "Ingredient.count" do
      post ingredients_url params: {
        ingredient: {
          description: @i.description,
          fresh: @i.fresh,
          name: @i.name
        }
      }
      assert_response :success
    end
  end

  test "should post on #destroy" do
    assert_difference("Ingredient.count", -1) do
      delete ingredient_url(@i.id)
      assert_response :redirect
    end
  end

  test "should not delete when id not found" do
    assert_no_difference "Ingredient.count" do
      delete ingredient_url(@i.id + 1)
      assert_response :redirect
    end
  end
end
