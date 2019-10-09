class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

     def show
        user = User.find(params[:id])
        render json: user
    end
    
    def create
       user = User.create(user_params)
       token = JWT.encode({user_id: user.id}, ENV['JWT_TOKEN']) if user
       if (user.valid?)
        render json: {token: token, username: user.username, id: user.id }  
       else
        render :json => { :errors => user.errors.full_messages, :code => 69 }
       end
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end


    private

    def user_params
        params.require(:user).permit(:email, :full_name, :username, :password, :age, :city, :occupation, :company, :school)
    end

    
end


