class Prefecture < ApplicationRecord
  
  has_many :cities
  belongs_to :post
  
  validates :name, presence: true
  
end
