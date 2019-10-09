class User < ApplicationRecord
  has_many :plans
  has_many :invites, through: :plans
end
