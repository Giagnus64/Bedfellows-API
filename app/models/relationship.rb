class Relationship < ApplicationRecord
    belongs_to :asker, class_name: 'User'
    belongs_to :askee, class_name: 'User'
    has_many :outings, dependent: :destroy

end
