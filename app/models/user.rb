class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)(?=.*?[!@#$%^&*()])[a-z\d!@#$%^&*()]+\z/i, message: "は半角英数字と特殊文字を含む文字列で入力してください" }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角漢字・ひらがな・カタカナで入力してください" }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角漢字・ひらがな・カタカナで入力してください" }
  validates :phonetic_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :phonetic_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :birthday, presence: true
end
