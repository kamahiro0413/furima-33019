FactoryBot.define do
  factory :user do
    transient do
      gimei { Gimei.name }
   end
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Alphanumeric.alphanumeric(number: 10)
    password {password}
    password_confirmation {password}
    last_name {gimei.last.kanji}
    first_name {gimei.first.kanji}
    last_name_reading {gimei.last.katakana}
    first_name_reading {gimei.first.katakana}
    birthday {Faker::Date.backward}
  end
end