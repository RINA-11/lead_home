class Image < ApplicationRecord
  
  belongs_to :post
  
  mount_uploader :post_image, ImageUploader
  
  validates :post_id, presence: true
  validates :post_image, presence: true
  
end