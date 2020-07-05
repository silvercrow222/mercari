class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, :nickname, :phone, :email, :encrypted_password, :icon, :profile,presence: true
end
