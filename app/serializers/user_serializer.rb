class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :username, :avatar, :profile_pic, :age, :city, :occupation, :company, :school, :plans, :invites, :friends, :requested_friends, :pending_friends
  
#   has_many :plans
#   has_many :invites, through: :plans 
end
