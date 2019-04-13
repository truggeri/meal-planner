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
#  account_id  :bigint
#

FactoryBot.define do
  factory :ingredient do
    account
    name        { FFaker::Food.ingredient }
    description { FFaker::Lorem.phrase }
    fresh       { [true, false].sample }
  end
end
