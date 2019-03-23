class Ingredient < ApplicationRecord
  validates :name,        presence: true, length: { maximum: 50 }, uniqueness: true
  validates :description, presence: true, length: { maximum: 200 }
end
