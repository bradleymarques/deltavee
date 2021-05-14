##
# Models a solar system with Stars, Planets, etc.
#
class System < ApplicationRecord
  MAX_NAME_LENGTH = 100
  MIN_NAME_LENGTH = 2

  validates :name, presence: true, length: { minimum: MIN_NAME_LENGTH, maximum: MAX_NAME_LENGTH }
  validates :x_parsecs, presence: true
  validates :y_parsecs, presence: true
  validates :z_parsecs, presence: true
end
