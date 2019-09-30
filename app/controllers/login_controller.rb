class LoginController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.find_by(username: login_params[:username])
        if user && user.authenticate(login_params[:password])
            token = encode_token({user_id: user.id})
            render json: {user: user, token: token }, status: :accepted
        else
            render json: {message: "Invalid Username or Password! Please try again!"}, status: :unauthorized
        end
    end

    private

    def login_params
        params.require(:login).permit(:username, :password)
    end

end
