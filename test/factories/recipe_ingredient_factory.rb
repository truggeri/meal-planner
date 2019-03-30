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

FactoryBot.define do
  factory :recipe_ingredient do
    amount  { Random.rand(1..500) }
    measure { RecipeIngredient.measures.keys.sample }

    association :recipe,      factory: :recipe
    association :ingredient,  factory: :ingredient
  end
end
