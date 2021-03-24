class Item < ApplicationRecord
  belongs_to :user
  has_one    :order
  has_one_attached :image

  with_options presence: true do
    validates :name,      length: {maximum: 40}
    validates :info,      length: {maximum: 1000}
    validates :image
    validates :price,     numericality: { only_integer: true,
      greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'は¥300 ~ 9,999,999の半角で入力してください。'}
  end

  with_options numericality:{ other_than: 0, message: 'を選択して下さい'} do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :schedule_delivery_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :schedule_delivery
end
