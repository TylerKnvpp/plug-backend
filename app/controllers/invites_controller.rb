class InvitesController < ApplicationController

     def index
        invites = Invite.all
        render json: invites
    end
    
    def show
        invite = Invite.find(params[:id])
        render json: invite
    end

    def update
        invite = Invite.find(params[:id])
        invite.update(invite_params)
        render json: invite
    end

    def create
        invite = Invite.create(invite_params)
        Plan.create({user_id: params[:user_id], invite_id: invite.id})
        params[:invitedUsers].each{|user| Plan.create({user_id: user, invite_id: invite.id})}
        if (invite.valid?)
        render json: {invite: invite}  
       else
        render :json => { :errors => invite.errors.full_messages, :code => 69 }
       end
    end
    
    def invited_users
        invite = Invite.find(params[:invite_id])
        users = invite.invited_users
        usersArray = users.split(',')
        invited = []
        usersArray.each do |user|
           user = User.find(user)
           invited.push(user)
        end

        render json: {invited_users: invited}
    end

    private

    def invite_params
        params.require(:invite).permit(:user_id, :category, :location, :time, :details, :invited_users)
    end

    # def plans_params
    #     params.require(:invite).permit(:invitedUsers)
    # end

end