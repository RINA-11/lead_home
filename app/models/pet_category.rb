class PetCategory < ApplicationRecord
  
  belongs_to :post
  
  validates :name, presence: true
  
end
