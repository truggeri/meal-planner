# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  active                 :boolean          default(TRUE), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string(50)       not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryBot.define do
  USER_ACTIVE_PERCENTAGE = 75

  factory :user, class: User do
    active    { Random.rand(0..100) < USER_ACTIVE_PERCENTAGE }
    email     { FFaker::Internet.email }
    name      { FFaker::Name.html_safe_name }
    password  { FFaker::Internet.password }
  end
end
