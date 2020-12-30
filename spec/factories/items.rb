FactoryBot.define do
  factory :item do
    association :user
    item_name { Faker::Name.name }
    explanation { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 3 }
    shipping_cost_id { 2 }
    prefecture_id { 3 }
    days_to_ship_id { 2 }
    price { Faker::Number.between(from: 300, to: 9999999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
