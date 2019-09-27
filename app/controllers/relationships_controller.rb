class RelationshipsController < ApplicationController
    skip_before_action :authorized

    def create 
        relationship = Relationship.create(rel_params)
        if(relationship.valid?)
            render json: relationship, status: :created 
        else 
            render json: relationship.errors.full_messages
        end 
    end
    
    def show
        relationship = Relationship.find(params[:id])
        options = {
            include: {
            asker: {except: [:updated_at, :created_at, :password]},
            askee: {except: [:updated_at, :created_at, :password]},
            }, 
            except: [:created_at, :updated_at]
        }
        render json: RelationshipSerializer.new(relationship).to_serialized_json(options)
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
    
    def rel_params
        params.require(:relationship).permit(:asker_id, :askee_id, :anniversary, :start_date, :first_date, :nickname)
    end

end
