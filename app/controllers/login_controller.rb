class LoginController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.find_by(username: login_params[:username])
        if user && user.authenticate(login_params[:password])
            token = encode_token({user_id: user.id})
            options = {
                include: {
                    asked_for_relationships: {
                            include: {
                                asker: {except:[:created_at, :updated_at, :password_digest]}
                            }, except: [:created_at, :updated_at, :password_digest]
                    },
                    asking_for_relationships: {
                        include: {
                            askee: {except:[:created_at, :updated_at, :password_digest]}
                        }, except: [:updated_at, :created_at]
                    },
                },
                except: [:created_at, :updated_at, :password_digest]
            }
            userHash = user.as_json(options)
            puts userHash
            userHash[:token] = token
            render json: userHash, status: :accepted
        else
            render json: {messages: ["Invalid Username or Password! Please try again!"]}, status: :unauthorized
        end
    end

    private

    def login_params
        params.permit(:username, :password)
    end

end
