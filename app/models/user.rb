class User < ApplicationRecord
  
  has_many :posts, dependent: :destroy
  has_many :clips, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :clip_posts, through: :clips, source: "post"
  
  validates :name, presence: true,
                   length: { maximum: 30 }
  validates :email, presence: true,
                    length: { maximum: 255 },
                    uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true,
                       length: { minimum: 6, maximum: 10 },
                       format: { with: /\A[\w]+\z/i }
                         
  has_secure_password
  
end