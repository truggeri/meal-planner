# == Schema Information
#
# Table name: recipe_ingredients
#
#  id             :integer          not null, primary key
#  amount         :integer          not null
#  measure        :integer          not null
#  precise_amount :boolean          default(FALSE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  ingredient_id  :bigint           not null
#  recipe_id      :bigint           not null
#
# Indexes
#
#  index_recipe_ingredients_on_recipe_id_and_ingredient_id  (recipe_id,ingredient_id) UNIQUE
#

require "test_helper"

class RecipeIngredientTest < ActiveSupport::TestCase
  def setup
    @ri = create(:recipe_ingredient)
  end

  test "amount greater than zero" do
    @ri.amount = 0
    assert_not @ri.valid?
  end
end
