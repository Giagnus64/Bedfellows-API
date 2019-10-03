class OutingSerializer

    def initialize(outing_obj)
        @outing_obj = outing_obj
    end

    def to_serialized_json(options)
        @outing_obj.to_json(options)
    end

    def get_serialized
       asking_arr = JSON.parse(self.asking_serializer)
       asked_arr = JSON.parse(self.asked_serializer)
       outing_arr = asking_arr + asked_arr 
       outing_arr.to_json()
    end

    def asking_serializer
        @outing_obj[:asking].to_json(
          {include: {
                relationship: {
                    include: {
                        askee: {only: [:first_name, :last_name]},
                    }, only: [:id]}, 
                    }, except: [:created_at, :updated_at] }
        )
    end

    def asked_serializer
        @outing_obj[:asked].to_json(
          {include: {
                relationship: {
                    include: {
                        asker: {only: [:first_name, :last_name]},
                    }, only: [:id]}, 
                    }, except: [:created_at, :updated_at] }
        )
    end
end