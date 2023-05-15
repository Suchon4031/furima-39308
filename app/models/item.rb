class Item < ApplicationRecord
  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :condition_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :delivery_fee_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :delivery_date_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :price, presence: true,  numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: {with:/\A[0-9]+\z/}
  validates :user, presence: true

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  has_one :condition
  has_one :delivery_fee
  has_one :prefecture
  has_one :delivery_date
end
