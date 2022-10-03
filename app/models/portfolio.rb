class Portfolio < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validates_uniqueness_of :user_id, scope: :stock_id
end
