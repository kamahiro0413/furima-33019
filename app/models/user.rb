class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, presence: true, format: { with: /(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]/, message: 'Include both letters and numbers' }
  validates :password_confirmation, presence: true, format: { with: /(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]/, message: 'Include both letters and numbers' }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' }
  validates :last_name_reading, presence: true, format: { with: /\A[ァ-ヶ一-]+\z/, message: 'Full-width katakana characters' }
  validates :first_name_reading, presence: true, format: { with: /\A[ァ-ヶ一-]+\z/, message: 'Full-width katakana characters' }
  validates :birthday, presence: true
end
