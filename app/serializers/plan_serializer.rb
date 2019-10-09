 class PlanSerializer < ActiveModel::Serializer
   attributes :id, :accepted, :user, :invite
     
#    belongs_to :invites
#    belongs_to :users
 end
