FactoryBot.define do
  factory :purchase_information do
    token               {"tok_abcdefghijk00000000000000000"}
    postal_code         {'100-0000'}
    shipping_area_id    {2}
    municipality        {'市区町村'}
    house_number        {'1-1'}
    building            {'建物'}
    phone_number        {'09012345678'}
    #name                { "MyString" }
    #email               { "MyString" }
  end
end
