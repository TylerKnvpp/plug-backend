class Invite < ApplicationRecord
  has_many :plans
  has_many :users, through: :plans

  # def created_at
  #   super().strftime('%m/%d/%Y')
  # end

  # def time
  #   super().strftime('%m/%d/%Y')
  # end
end
