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

class Recipe < ApplicationRecord
  has_many    :recipe_ingredient
  belongs_to  :account

  validates :description,     presence: true, length: { maximum: 500 }
  validates :minutes_to_make, numericality: { only_integer: true, greater_than: 0, less_than: 1440 }
  validates :name,            presence: true, length: { maximum: 50 }, uniqueness: true
end
