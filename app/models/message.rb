class Message < ApplicationRecord
  
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true,
                      length: { maximum: 1000 }

  belongs_to :user
  belongs_to :post
  
end
