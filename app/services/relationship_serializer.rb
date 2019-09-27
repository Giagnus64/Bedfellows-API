class RelationshipSerializer

    def initialize(rel_obj)
        @relationship = rel_obj
    end

    def to_serialized_json(options)
        @relationship.to_json(options)
    end

end