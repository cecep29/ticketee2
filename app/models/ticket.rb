class Ticket < ApplicationRecord
  validates :name, :description, presence: true
  validates :description, length: { minimum: 10 }

  belongs_to :project
  belongs_to :author, class_name: "User"
  has_many :comments, dependent: :destroy
end
