class Image < ApplicationRecord
  
  validates :post_id, presence: true
  validates :post_image, presence: true
  
  belongs_to :post
  
end