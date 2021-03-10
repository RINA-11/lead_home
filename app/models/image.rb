class Image < ApplicationRecord
  
  belongs_to :post, inverse_of: :images
  
  mount_uploader :post_image, ImageUploader
  
  #validates :post_id, presence: true
  validates :post_image, presence: true
  
end