class Prefecture < ApplicationRecord
  
  has_many :cities
  has_one :post
  
  validates :name, presence: true
  
end
