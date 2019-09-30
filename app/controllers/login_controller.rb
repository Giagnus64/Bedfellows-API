class LoginController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.find_by(username: login_params[:username])
        if user && user.authenticate(login_params[:password])
            token = encode_token({user_id: user.id})
             userHash = user.as_json(except: [:password_digest, :created_at, :updated_at])
             userHash[:token] = token
            render json: userHash, status: :accepted
        else
            render json: {message: "Invalid Username or Password! Please try again!"}, status: :unauthorized
        end
    end

    private

    def login_params
        params.permit(:username, :password)
    end

end
