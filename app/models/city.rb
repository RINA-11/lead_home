class City < ApplicationRecord
  
  belongs_to :prefecture
  has_one :post
  
  validates :prefecture_id, presence: true
  validates :name, presence: true
  
end