class Stock < ApplicationRecord
  belongs_to :users

  validates :symbol, presence: true
end
