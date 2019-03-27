# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  active     :boolean          default(TRUE), not null
#  email      :string(100)      not null
#  name       :string(50)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email)
#

class User < ApplicationRecord
  has_many  :ingredients

  validates :email,  presence: true, length: { maximum: 100 }, uniqueness: true
  validates :name,   presence: true, length: { maximum: 50 }
end
