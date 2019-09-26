class User < ApplicationRecord
    has_many :asking_for_relationships, foreign_key: :asker_id, class_name: 'Relationship', dependent: :destroy
    
    has_many :askees, through: :asking_for_relationships

    has_many :asked_for_relationships, foreign_key: :askee_id, class_name: 'Relationship', dependent: :destroy

    has_many :askers, through: :asked_for_relationships

    has_secure_password
    validates :username, :first_name, :last_name, :password_digest, presence: true
    validates :username, uniqueness: {case_sensitive: false}

end
