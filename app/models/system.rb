##
# Models a solar system with Stars, Planets, etc.
#
class System < ApplicationRecord
  MIN_NAME_LENGTH = 3
  MAX_NAME_LENGTH = 100

  validates :x_position, presence: true
  validates :y_position, presence: true
  validates :z_position, presence: true
  validates :proper_name, presence: true, length: { minimum: MIN_NAME_LENGTH, maximum: MAX_NAME_LENGTH }
end
