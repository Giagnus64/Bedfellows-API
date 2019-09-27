class OutingsController < ApplicationController

    def create 
        outing = Outing.create(outing_params)
        if(outing.valid?)
            
            render json: outing, status: :created 
        else 
            render json: outing.errors.full_messages
        end 
    end
    
    def show
        outing = Outing.find(params[:id])
         options = {
            include: {
            relationship: {except: [:updated_at, :created_at]},
            }, 
            except: [:created_at, :updated_at] 
        }
        render json: OutingSerializer.new(outing).to_serialized_json(options)
    end
    
    def update
        outing = Outing.find(params[:id])
        outing.update(outing_params) 
        if outing.valid?
            render json: outing, status: :ok
        else 
            render json: outing.errors.full_messages
        end 
    end

    def destroy
        outing = Outing.find(params[:id])
        outing.destroy()
        render json: {message: "Outing was destroyed"}
    end

    private
    
    def outing_params
        params.require(:outing).permit(:relationship_id, :activity, :time, :location)
    end
end
