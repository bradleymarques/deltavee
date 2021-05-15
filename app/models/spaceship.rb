class Spaceship < ApplicationRecord
  MAX_NAME_LENGTH = 100
  MIN_NAME_LENGTH = 1

  belongs_to :owned_by, class_name: User.name, required: true
  belongs_to :fleet, required: true

  validates :name, presence: true, length: { minimum: MIN_NAME_LENGTH, maximum: MAX_NAME_LENGTH }
  validates :ship_class, presence: true

  validate :fleet_owned_by_same_user

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

  private

  def fleet_owned_by_same_user
    return if owned_by == fleet.owned_by

    errors.add(:fleet, "owner is not the same as the spaceship owner")
  end
end
