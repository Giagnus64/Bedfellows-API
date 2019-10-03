class RelationshipsController < ApplicationController
    
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
            asker: {except: [:updated_at, :created_at, :password_digest]},
            askee: {except: [:updated_at, :created_at, :password_digest]},
            outings: {except: [:created_at, :updated_at]},
            }, 
            except: [:created_at, :updated_at]
        }
        render json: RelationshipSerializer.new(relationship).to_serialized_json(options)
    end
    
    def update
        relationship = Relationship.find(params[:id])
        relationship.update(rel_params)
        options = {
            include: {
            asker: {except: [:updated_at, :created_at, :password_digest]},
            askee: {except: [:updated_at, :created_at, :password_digest]},
            outings: {except: [:created_at, :updated_at]},
            },
            except: [:created_at, :updated_at]
        } 
        if relationship.valid?
            render json: RelationshipSerializer.new(relationship).to_serialized_json(options), status: :ok
        else 
            render json: relationship.errors.full_messages
        end 
    end

    def destroy
        relationship = Relationship.find(params[:id])
        relationship.destroy()
        render json: {message: "#{relationship.nickname} was destroyed"}
    end

    private
    
    def rel_params
        params.require(:relationship).permit(:asker_id, :askee_id, :anniversary, :nickname, :status)
    end

end
