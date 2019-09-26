class Relationship < ApplicationRecord
    belongs_to :asker, class_name: 'User'
    belongs_to :askee, class_name: 'User'
    validates :nickname, presence: true
end
