class Prefecture < ApplicationRecord
  
  validates :name, presence: true
  
  has_many :cities
  belongs_to :post
  
end
