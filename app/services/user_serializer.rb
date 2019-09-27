class UserSerializer

    def initialize(user_obj)
        @user = user_obj
    end

    def to_serialized_json(options)
        @user.to_json(options)
    end

end