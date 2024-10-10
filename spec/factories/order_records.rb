FactoryBot.define do
  factory :order_record do
    postalcode {'123-4567'}
    prefecture_id {2}
    city {'中区'}
    addresses {'北山1-1'}
    building {'ハイツ123'}
    phonenumber {'00000000000'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end