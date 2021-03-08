class City < ApplicationRecord
  
  belongs_to :prefecture
  belongs_to :post
  
  validates :prefecture_id, presence: true
  validates :name, presence: true
  
end