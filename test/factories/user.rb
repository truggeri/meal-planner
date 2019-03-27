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

FactoryBot.define do
  factory :user do
    name   { FFaker::Name.html_safe_name }
    email  { FFaker::Internet.email }
    active { true }
  end
end