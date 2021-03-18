FactoryBot.define do
  factory :user do
    nickname           {'test'}
    email              {'test@com'}
    encrypted_password {'a111111'}
    last_name          {'宮武'}
    first_name         {'昂平'}
    last_name_kana     {'ミヤタケ'}
    first_name_kana    {'コウヘイ'}
    birthday           {'1930-01-01'}
  end
end
