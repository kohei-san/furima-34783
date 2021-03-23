FactoryBot.define do
  factory :item do
    name                 {Faker::JapaneseMedia::StudioGhibli.character}
    info                 {Faker::JapaneseMedia::StudioGhibli.quote}
    category_id          {Faker::Number.between(from: 1, to:10 )}
    sales_status_id      {Faker::Number.between(from: 1, to:6 )}
    shipping_fee_id      {Faker::Number.between(from: 1, to:2 )}
    prefecture_id        {Faker::Number.between(from: 1, to:47)}
    schedule_delivery_id {Faker::Number.between(from: 1, to:3 )}
    price                {Faker::Number.between(from:300, to:9999999 )}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.png'), filename: 'sample.png', content_type: 'image/png')
    end
  end
end