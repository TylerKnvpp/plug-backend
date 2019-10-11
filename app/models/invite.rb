class Invite < ApplicationRecord
  has_many :plans
  has_many :users, through: :plans
end
