class Spaceship < ApplicationRecord
  belongs_to :owned_by, class_name: User.name, required: true

  MAX_NAME_LENGTH = 100
  MIN_NAME_LENGTH = 1

  validates :name, presence: true, length: { minimum: MIN_NAME_LENGTH, maximum: MAX_NAME_LENGTH }
  validates :ship_class, presence: true

  enum ship_class: {
    shuttle: 0,
    scout: 10,
    fighter: 20,
    bomber: 30,
    corvette: 40,
    frigate: 50,
    destroyer: 60,
    cruiser: 70,
    carrier: 80,
    battlecruiser: 90,
    capital: 100,
    super_capital: 110
  }
end
