# == Schema Information
#
# Table name: recipes
#
#  id              :integer          not null, primary key
#  description     :text(500)        not null
#  minutes_to_make :integer
#  name            :string(50)       not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint           not null
#

FactoryBot.define do
    factory :recipe do
      description     { FFaker::Lorem.phrase } 
      minutes_to_make { Random.rand(1..1440) }
      name            { "#{FFaker::Food.meat} with #{FFaker::Food.vegetable}s" }
      association     :user, factory: :user
    end
  end
