class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :username, :age, :city, :occupation, :company, :school, :plans, :invites
  
#   has_many :plans
#   has_many :invites, through: :plans 
end
