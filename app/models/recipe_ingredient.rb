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

class RecipeIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe

  validates :amount, numericality: { only_integer: true, greater_than: 0 }
  enum measure: {
    oz:         0,
    gram:       1,
    teaspoon:   2,
    tablespoon: 3,
    cup:        4
  }
end
