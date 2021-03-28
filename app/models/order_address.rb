class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token
  
  #orderモデルのバリデーション 
  # validates :user_id,    presence: true
  # validates :item_id,    presence: true

  #addressモデルのバリデーション
  with_options presence: true do
    validates :postal_code  #,   format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id  #, numericality { other_than: o, message: 'must be selected' }
    validates :city
    validates :address
    validates :phone_number  #,  numericality { only_integer: true }, length {maximum: 11}, length { mimimum: 9}
    # validates :order_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end

#カード情報入力のバリデーションも追記すること