class Post < ApplicationRecord
  belongs_to :user
  belongs_to :purpose
  belongs_to :pet_category
  belongs_to :city
  belongs_to :pet_sex
  belongs_to :image
end
