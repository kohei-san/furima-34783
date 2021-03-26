class Address < ApplicationRecord
  with_options presence: true do
    validates :postal_code  #,   format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id  #, numericality { other_than: o, message: 'must be selected' }
    validates :city
    validates :address
    validates :phone_number  #,  numericality { only_integer: true }, length {maximum: 11}, length { mimimum: 9}
    validates :order
  end

  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end