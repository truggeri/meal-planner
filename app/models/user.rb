class User < ApplicationRecord
  validates :email,  presence: true, length: { maximum: 100 }, uniqueness: true
  validates :name,   presence: true, length: { maximum: 50 }
end
