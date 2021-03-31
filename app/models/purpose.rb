class Purpose < ApplicationRecord
  
  has_one :post
  
  validates :name, presence: true
  
end
