class Address < ApplicationRecord
  validates :post_code, presence: true
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :house_number, presence: true
  validates :building_name
  validates :phonenumber,presence: true
  validates :order,presence: true

  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
