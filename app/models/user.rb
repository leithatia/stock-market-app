class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :portfolios
  has_many :stocks, through: :portfolios

  validates :username, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false }
end
