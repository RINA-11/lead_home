class Image < ApplicationRecord
  
  belongs_to :post, inverse_of: :images, optional: true
  
  mount_uploaders :post_image, ImageUploader
  
  validates :post, presence: true
  validates :post_image, presence: true, length: { maximum:5 }
  
end