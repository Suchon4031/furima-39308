class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :nickname,           presence: true
  validates :email,              presence: true
  validates :password,           presence: true, format: {with: PASSWORD_REGEX}
  validates :lastname,           presence: true, format: {with:/\A[ぁ-んァ-ン一-龥]+\z/}
  validates :firstname,          presence: true, format: {with:/\A[ぁ-んァ-ン一-龥]+\z/}
  validates :lastname_kana,      presence: true, format: {with:/\A[ァ-ン]+\z/}
  validates :firstname_kana,     presence: true, format: {with:/\A[ァ-ン]+\z/}
  validates :birth_date,         presence: true

end