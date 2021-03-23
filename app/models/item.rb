class Item < ApplicationRecord
  belongs_to :user
  has_one    :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :schedule_delivery

  with_options presence: true do
    validates :name
    validates :info
    validates :price, numericality: { only_integer: true,
      greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'は¥300- ~ ¥9,999,999で入力してください。'}
    # 各バリデーション追記必要か確認のこと
  end

  with_options numericality:{ other_than: 0 } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :schedule_delivery_id
  end
end
