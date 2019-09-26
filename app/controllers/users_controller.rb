class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create 
        @user = User.create(user_params)
        if(@user.valid?)
            @token = encode_token(user_id: @user.id)
            render json: {user: @user, token: @token}, status: :created 
        else 
            render json: @user.errors.full_messages
        end 
    end



    private
    
    def user_params
        params.require(:user).permit(:username, :password, :first_name, :last_name)
    end

end
