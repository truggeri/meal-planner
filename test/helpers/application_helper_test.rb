require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full_title default" do
    assert_equal full_title, "Meal Planner"
  end

  test "full_title with parameter" do
    phrase = FFaker::Lorem.words(3).join(" ").to_s
    assert_equal full_title(phrase), "#{phrase} | Meal Planner"
  end
end
