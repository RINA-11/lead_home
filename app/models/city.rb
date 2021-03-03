class City < ApplicationRecord
  
  validates :prefecture_id, presence: true
  validates :name, presence: true
  
  belongs_to :prefecture
  belongs_to :post
  
end