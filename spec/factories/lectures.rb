FactoryBot.define do
  factory :lecture do
    sequence(:name, 'name_1')
    description { 'description' }
  end
end
