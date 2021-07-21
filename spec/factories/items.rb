FactoryBot.define do
  factory :item do
    name                        {'test'}
    description                 {'test'}
    category_id                 {2}
    status_id                   {2}
    shipping_charge_id          {2}
    shipping_area_id            {2}
    day_to_ship_id              {2}
    price                       {3000}
    association :user 
    

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end