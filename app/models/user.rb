class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "は有効なメールアドレスである必要があります" }
  validates :password, presence: true, length: { minimum: 6 }
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :phonetic_last_name, presence: true
  validates :phonetic_first_name, presence: true
  validates :birthday, presence: true
end
