class FriendsController < ApplicationController

    def index

        user = User.find(params[:user_id])
        users_friends = user.friends
        users_requests = user.pending_friends
        users_sent_requests = user.requested_friends
        users_blocked_accounts = user.blocked_friends
        render json: { user: user, friends: users_friends, pending_received: users_requests, pending_requests: users_sent_requests, blocked: users_blocked_accounts}
    end

    def friend_request
        user_sent_friend_request = User.find(params[:id])
        user_received_friend_request = User.find(params[:username])
        user_sent_friend_request.friend_request(user_received_friend_request)
        if user_sent_friend_request.friend_request(user_received_friend_request)
            render json: {message: "#{user_received_friend_request} received your friend request!"}
        else
            render json: {message: "Oops! Something went wrong."}
        end
    end

    def accept_friend_request
        user_sent_friend_request = User.find(params[:id])
        user_received_friend_request = User.find(params[:id])
        user_sent_friend_request.accept_request(user_received_friend_request)
        if user_sent_friend_request.accept_request(user_received_friend_request)
            render json: {message: "#{user_received_friend_request} is now your friend!"}
        else
            render json: {message: "Oops! Something went wrong."}
        end
    end

    def decline_friend_request
        user_sent_friend_request = User.find(params[:id])
        user_received_friend_request = User.find(params[:id])
        user_sent_friend_request.decline_request(user_received_friend_request)
        if user_sent_friend_request.decline_request(user_received_friend_request)
            render json: {message: "#{user_received_friend_request} said 'nah.'"}
        else
            render json: {message: "Oops! Something went wrong."}
        end
    end

    def friend_request_index
        user = User.find(params[:id])
        users_friend_requests = user.requested_friends
        render json: users_friend_requests
    end

    def check_if_friends
        user = User.find(params[:id])
        user_to_check = User.find(params[:username])
        user.friends_with?(user_to_check)
            if user.friends_with?(user_to_check)
                render json: {message: "You are friends with#{user_to_check}"}
            else
                render json: {message: "You are not friends with#{user_to_check}"}
            end
    end

    def block_user
        user = User.find(params[:id])
        user_to_block = User.find_by[params[:username]]
        user.block_friend(user_to_block)
        if user.block_friend(user_to_block)
            render json: {message: "#{user_to_block} has been blocked."}
        else
            render json: {message: "Oops! something went wrong"}
        end
    end


end
