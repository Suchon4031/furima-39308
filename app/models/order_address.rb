class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phonenumber, :order_id, :user_id, :item_id, :token

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :city, presence: true
  validates :house_number, presence: true 
  validates :phonenumber, presence: true, format: {with: /\A0\d{9,10}\z/}
  validates :token, presence: true


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phonenumber: phonenumber, order_id: order.id)
  end
end