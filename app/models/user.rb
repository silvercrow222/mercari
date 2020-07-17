class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE = /\A\d{10}$|^\d{11}\z/
  VALID_KATAKANA = /\A[\p{katakana}\p{blank}ー－]+\z/

  validates :family_name, :first_name, :birthday, :nickname, :encrypted_password, presence: true
  validates :profile, presence: true, allow_blank: true
  validates :icon, presence: true, allow_blank: true
  validates :email, {presence: true, format: { with: VALID_EMAIL }, uniqueness: { case_sensitive: false }}
  validates :phone, {presence: true, format: { with: VALID_PHONE }, uniqueness: { case_sensitive: false }}
  validates :family_name_kana, presence: true, format: { with: VALID_KATAKANA, message: 'はカタカナで入力して下さい'}
  validates :first_name_kana, presence: true, format: { with: VALID_KATAKANA, message: 'はカタカナで入力して下さい'}

  has_one :address
  has_one :card

end
