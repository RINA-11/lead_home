class Post < ApplicationRecord

  belongs_to :user
  belongs_to :purpose
  belongs_to :pet_category
  belongs_to :prefecture
  belongs_to :city
  belongs_to :pet_sex
  belongs_to :purpose
  has_one :image, dependent: :destroy, inverse_of: :post
  has_many :clips, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :clip_users, through: :clips, source: "user"
  
  accepts_nested_attributes_for :image, update_only: true
  
  mount_uploader :video, PostUploader
  
  validates_associated :image
  
  validates :image, presence: true
  validates :user_id, presence: true
  validates :purpose_id, presence: true
  validates :pet_category_id, presence: true
  validates :prefecture_id, presence: true
  validates :city_id, presence: true
  validates :pet_sex_id, presence: true
  validates :pet_breed, length: { maximum: 50 }
  validates :address_line, length: { maximum: 50 }
  validates :happened_at, presence: true
  validates :content, presence: true,
                      length: { maximum: 1000 }
  validates :pet_name, length: { maximum: 50 }
  
  scope :get_by_purpose_id, -> (purpose_id) { where(purpose_id: purpose_id) }
  scope :get_by_prefecture_id, -> (prefecture_id) { where(prefecture_id: prefecture_id) }
  scope :get_by_city_id, -> (city_id) { where(city_id: city_id) }
  scope :get_by_pet_category_id, -> (pet_category_id) { where(pet_category_id: pet_category_id) }
  scope :get_by_pet_breed, -> (pet_breed) { where(pet_breed: pet_breed) }
  scope :get_by_pet_sex_id, -> (pet_sex_id) { where(pet_sex_id: pet_sex_id) }
  
end