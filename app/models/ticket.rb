class Ticket < ApplicationRecord
  validates :name, :description, presence: true
  validates :description, length: { minimum: 10 }

  belongs_to :project
end
