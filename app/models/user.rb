class User < ApplicationRecord
  has_many :plans
  has_many :invites, through: :plans

  validates :username, uniqueness: true 

  has_friendship
  has_secure_password
end
