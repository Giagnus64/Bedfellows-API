class User < ApplicationRecord
    has_many :asking_for_relationships, foreign_key: :asker_id, class_name: 'Relationship', dependent: :destroy
    
    has_many :askees, through: :asking_for_relationships

    has_many :asked_for_relationships, foreign_key: :askee_id, class_name: 'Relationship', dependent: :destroy

    has_many :askers, through: :asked_for_relationships

    has_many :asking_outings, through: :asking_for_relationships, source: :outings
    has_many :asked_outings, through: :asked_for_relationships, source: :outings

    has_secure_password
    
    validates :username, :first_name, :last_name, presence: true
    validates :username, uniqueness: {case_sensitive: false}
    
    ##TODO: combine all relationships together
    #combines all outings together
    def get_all_outings
        askedArr = self.asked_outings
        askingArr = self.asking_outings
        outingObj = {asked: askedArr, asking: askingArr}
    end

end
