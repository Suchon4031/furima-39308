class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :nickname,           presence: true
  validates :password,           format: {with: PASSWORD_REGEX}
  validates :lastname,           presence: true, format: {with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :firstname,          presence: true, format: {with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :lastname_kana,      presence: true, format: {with:/\A[ァ-ヶー]+\z/}
  validates :firstname_kana,     presence: true, format: {with:/\A[ァ-ヶー]+\z/}
  validates :birth_date,         presence: true

  has_many :items
  has_many :orders
end