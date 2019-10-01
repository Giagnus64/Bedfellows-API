class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        users = User.all()
        render json: users.to_json(
            only: [:username, :id, :first_name, :last_name]
        )
    end

    def stranger_index
        currUser = User.find(params[:id])
        askersIds = currUser.askers.map {|asker| asker.id}        
        askeesIds = currUser.askees.map {|askee| askee.id}        
        filteredUsers = User.all.filter do |user|
            !askeesIds.include?(user.id) && !askersIds.include?(user.id) && currUser.id != user.id
        end
        render json: filteredUsers.to_json(
            only: [:username, :id, :first_name, :last_name]
        )
    end

    def create
        userPassword = params[:password]
        new_user_params = user_params
        new_user_params[:password] = userPassword
        user = User.create(new_user_params)
        if(user.valid?)
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
            render json: userHash, status: :created
        else
            render json: user.errors.full_messages
        end
    end

    def show
        user = User.find(params[:id])
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
