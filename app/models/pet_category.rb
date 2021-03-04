class PetCategory < ApplicationRecord
  
  validates :name, presence: true
  
  belongs_to :post
  
end