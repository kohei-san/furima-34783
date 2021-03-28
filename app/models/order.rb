class Order < ApplicationRecord
  # attr_accessor :token
  # attr_accessor :price

  belongs_to :user
  belongs_to :item
  has_one    :address
end
