# == Schema Information
#
# Table name: recipes
#
#  id              :integer          not null, primary key
#  description     :text(500)        not null
#  display         :boolean
#  minutes_to_make :integer
#  name            :string(50)       not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_id      :bigint
#
# Indexes
#
#  index_recipes_on_display  (display)
#

FactoryBot.define do
  RECIPE_DISPLAY_PERCENTAGE = 70

  factory :recipe do
    account
    description     { FFaker::Lorem.phrase[0, 500] }
    display         { Random.rand(1..100) < RECIPE_DISPLAY_PERCENTAGE }
    minutes_to_make { Random.rand(1..1399) }
    name            { "#{FFaker::Food.meat} with #{FFaker::Food.vegetable}s"[0, 50] }
  end
end
