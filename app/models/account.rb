# == Schema Information
#
# Table name: accounts
#
#  id           :integer          not null, primary key
#  active       :boolean          default(TRUE), not null
#  name         :string           not null
#  primary_user :bigint
#  users_count  :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Account < ApplicationRecord
  belongs_to :primary_user, foreign_key: :primary_user, class_name: User.name, optional: true
  has_many   :ingredients, dependent: :destroy
  has_many   :recipes,     dependent: :destroy
  has_many   :users,       dependent: :nullify

  validates  :name, presence: true, length: { maximum: 100 }
end
