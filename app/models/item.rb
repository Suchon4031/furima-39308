class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :condition_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :delivery_fee_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :delivery_date_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :price, presence: true
  validates :user, presence: true

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  has_one :condition
  has_one :Delivery_fee
  has_one :prefecture
  has_one :delivery_date
end
