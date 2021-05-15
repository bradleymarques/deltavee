##
# Models a solar system with Stars, Planets, etc.
#
class System < ApplicationRecord
  MAX_NAME_LENGTH = 100
  MIN_NAME_LENGTH = 1

  validates :name, presence: true, length: { minimum: MIN_NAME_LENGTH, maximum: MAX_NAME_LENGTH }
  validates :x, presence: true # measured in parsecs from Sol
  validates :y, presence: true # measured in parsecs from Sol
  validates :z, presence: true # measured in parsecs from Sol
end
