class Post < ApplicationRecord

  belongs_to :user
  has_one :purpose
  has_one :pet_category
  has_one :prefecture
  has_one :city
  has_one :pet_sex
  has_one :purpose
  has_many :images, dependent: :destroy, inverse_of: :post
  has_many :clips, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :clip_users, through: :clips, source: "user"
  
  accepts_nested_attributes_for :images
  
  validates_associated :images
  
  validates :images, presence: true
  validates :user_id, presence: true
  validates :purpose_id, presence: true
  validates :pet_category_id, presence: true
  validates :prefecture_id, presence: true
  validates :city_id, presence: true
  validates :pet_sex_id, presence: true
  validates :pet_breed, length: { maximum: 50 }
  validates :address_line, length: { maximum: 200 }
  validates :happened_at, presence: true
  validates :content, presence: true,
                      length: { maximum: 1000 }
  
end