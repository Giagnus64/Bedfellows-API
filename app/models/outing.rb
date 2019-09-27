class Outing < ApplicationRecord
  belongs_to :relationship
  validates :time, :activity, presence: true
end
