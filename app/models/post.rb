class Post < ApplicationRecord
  
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

  belongs_to :user
  belongs_to :purpose
  has_one :pet_category
  has_one :prefecture
  has_one :city
  has_one :pet_sex
  has_one :purpose
  has_many :images, dependent: :destroy
  has_many :clips
  has_many :messages, dependent: :destroy
  
end