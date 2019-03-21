class Ingredient < ApplicationRecord
  validates :name,        presence: true, length: { maximum: 64 }, uniqueness: true
  validates :description, presence: true, length: { maximum: 255 }
end
