class Stock < ApplicationRecord
  has_many :portfolios
  has_many :users, through: :portfolios

  validates :symbol, :name, presence: true
end
