class Fleet < ApplicationRecord
  MAX_NAME_LENGTH = 100
  MIN_NAME_LENGTH = 1

  belongs_to :owned_by, class_name: User.name, required: true
  belongs_to :system, required: true

  validates :name, presence: true, length: { minimum: MIN_NAME_LENGTH, maximum: MAX_NAME_LENGTH }

  has_many :spaceships

  validates :spaceships, length: { minimum: 1 }
end
