class User < ApplicationRecord
  has_many :plans
  has_many :invites, through: :plans
  has_one_attached :profile_pic
  validates :username, uniqueness: true 

  has_friendship
  has_secure_password
end
