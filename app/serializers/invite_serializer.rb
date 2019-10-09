class InviteSerializer < ActiveModel::Serializer
  attributes :id, :category, :time, :location, :plans

  has_many :plans
#   has_many :users, through: :plans
end
