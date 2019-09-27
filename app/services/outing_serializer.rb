class OutingSerializer

    def initialize(outing_obj)
        @outing = outing_obj
    end

    def to_serialized_json(options)
        @outing.to_json(options)
    end

end