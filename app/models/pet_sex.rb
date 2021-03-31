class PetSex < ApplicationRecord
  
  validates :name, presence: true
  
  has_one :post
  
end
