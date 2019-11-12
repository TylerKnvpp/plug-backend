class InviteSerializer < ActiveModel::Serializer
  attributes :id, :category, :time, :location, :invited_users, :plans

  has_many :plans
#   has_many :users, through: :plans
end
