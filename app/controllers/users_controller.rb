class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        users = User.all()
        render json: users.to_json(
            only: [:username, :id] 
        )
    end

    def create 
        user = User.create(user_params)
        if(user.valid?)
            token = encode_token({user_id: user.id})
            render json: {user: UserSerializer.new(user).to_serialized_json({}), token: token}, status: :created 
        else 
            render json: user.errors.full_messages
        end 
    end
    
    def show
        user = User.find(params[:id])
         options = {
            include: {
            asked_for_relationships: {except: [:updated_at, :created_at]},
            asking_for_relationships: {except: [:updated_at, :created_at]},
            }, 
            except: [:created_at, :updated_at, :password_digest] 
        }
        render json: UserSerializer.new(user).to_serialized_json(options)
    end
    
    def update
        user = User.find(params[:id])
        user.update(user_params)
        options = {
            except: [:created_at, :updated_at, :password_digest]
        } 
        if user.valid?
            render json: {user: UserSerializer.new(user).to_serialized_json(options)}, status: :ok
        else 
            render json: user.errors.full_messages
        end 
    end

    def destroy
        user = User.find(params[:id])
        user.destroy()
        render json: {message: "#{user.username} was destroyed"}
    end

    private
    
    def user_params
        params.require(:user).permit(:username, :password, :first_name, :last_name)
    end

end
