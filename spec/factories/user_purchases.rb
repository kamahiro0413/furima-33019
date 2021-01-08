FactoryBot.define do
  factory :user_purchase do
    postal_code { '123-4567' }
    prefecture_id { 3 }
    city { Faker::Address.city }
    house_number { Faker::Address.building_number }
    building_name { Faker::Lorem.sentence }
    phone_num { Faker::PhoneNumber.subscriber_number(length: 11) }
    token {"tok_abcdefghijk123456789"}
  end
end
