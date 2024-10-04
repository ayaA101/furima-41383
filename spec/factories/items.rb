FactoryBot.define do
  factory :item do
    association :user

    item_name { Faker::Name.initials(number: 2) }
    item_info { 'あいう' }
    item_category_id { 2 }
    item_status_id { 2 }
    option_id { 2 }
    prefecture_id { 2 }
    schedule_id { 2 }
    price { 500 }
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end

end