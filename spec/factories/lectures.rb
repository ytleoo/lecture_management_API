# == Schema Information
#
# Table name: lectures
#
#  id          :bigint           not null, primary key
#  description :string(191)      not null
#  name        :string(191)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :lecture do
    sequence(:name, 'name_1')
    description { Faker::Movies::StarWars.quote }
  end
end
