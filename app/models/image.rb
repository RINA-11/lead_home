class Image < ApplicationRecord
  
  belongs_to :post, inverse_of: :image, optional: true
  
  mount_uploader :post_image1, ImageUploader
  mount_uploader :post_image2, ImageUploader
  mount_uploader :post_image3, ImageUploader
  mount_uploader :post_image4, ImageUploader
  mount_uploader :post_image5, ImageUploader
  
  validates :post, presence: true
  validates :post_image1, presence: true
  #validates :post_image2,
  #validates :post_image3,
  #validates :post_image4,
  #validates :post_image5,
  
end