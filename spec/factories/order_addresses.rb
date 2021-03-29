FactoryBot.define do
  factory :order_address do
    postal_code     {"123-4567"}
    prefecture_id   {Faker::Number.between(from: 1, to: 47)}
    city            {Faker::Address.city}
    address         {Faker::Address.secondary_address}
    building        {Faker::Address.mail_box}
    phone_number    {Faker::Number.number(digits: 11)}
  end
end