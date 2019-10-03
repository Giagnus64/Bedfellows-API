class UserSerializer

    def initialize(user_obj)
        @user = user_obj
    end

    def to_serialized_json(options)
        @user.to_json(options)
    end

    def get_serialized_partners
        partnersArr = self.get_asking_partners + self.get_asked_partners
        partnersArr.to_json()
    end

    def get_asked_partners
        askingRels = @user.asking_for_relationships.select do |rel|
            rel.status == "confirmed"
        end
        askingPartners = askingRels.map do |rel|
             {partner:rel.askee.slice(:first_name, :last_name), relationship_id: rel.id}
        end
        return askingPartners
    end
    def get_asking_partners
        askedRels = @user.asked_for_relationships.select do |rel|
            rel.status == "confirmed"
        end
        askedPartners = askedRels.map do |rel|
            hash = {partner:rel.asker.slice(:first_name, :last_name), relationship_id:rel_id}
        end
    end

end