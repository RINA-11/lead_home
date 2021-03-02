class User < ApplicationRecord
  
  validates :name, presence: true,
                   length: { maximum: 30 }
                   
  validates :email, presence: true,
                    length: { maximum: 255 },
                    uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
                      
  validates :password, presence: true,
                       length: { minimum: 8},
                       format: { with: /\A[\w\-]+\z/ }
  
  has_secure_password
  
end
