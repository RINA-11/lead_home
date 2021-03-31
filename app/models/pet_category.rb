class PetCategory < ApplicationRecord
  
  has_one :post
  
  validates :name, presence: true
  
end
