class OrderRecord
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postalcode, :prefecture_id, :city, :addresses, :building, :phonenumber

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postalcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :addresses
    validates :phonenumber, format: { with: /\A\d{10,11}\z/,message: "is invalid."}
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShoppingAddress.create(postalcode: postalcode, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phonenumber: phonenumber, order_id: order.id)
  end
end