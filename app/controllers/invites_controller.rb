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
        render json: invite
    end
    


    private

    def invite_params
        params.require(:invite).permit()
    end

end