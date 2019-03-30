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
#  user_id     :bigint
#

class Ingredient < ApplicationRecord
  has_many    :recipe_ingredient
  belongs_to  :user
  
  validates   :name,        presence: true, length: { maximum: 50 }, uniqueness: true
  validates   :description, presence: true, length: { maximum: 200 }
end
