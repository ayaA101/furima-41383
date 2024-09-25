FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { "1a" + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '漢字' }
    first_name            { '漢字' }
    last_name_kana        { 'カタカナ' }
    first_name_kana       { 'カタカナ' }
    birth_date            { Faker::Date.birthday }
  end
end