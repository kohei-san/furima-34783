FactoryBot.define do
  factory :user do
    nickname              {Faker::Internet.username}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'宮武'}
    first_name            {'昂平'}
    last_name_kana        {'ミヤタケ'}
    first_name_kana       {'コウヘイ'}
    birthday              {'1930-01-01'}
  end
end