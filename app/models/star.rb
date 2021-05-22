class Star < ApplicationRecord
  validates :right_ascension, presence: true # degrees
  validates :declination, presence: true # degrees
  validates :distance_from_sol, presence: true # parsecs
  validates :x, presence: true # parsecs
  validates :y, presence: true # parsecs
  validates :z, presence: true # parsecs
  validates :velocity_x, presence: true # parsecs per year
  validates :velocity_y, presence: true # parsecs per year
  validates :velocity_z, presence: true # parsecs per year
  validates :visual_magnitude, presence: true
  validates :absolute_magnitude, presence: true
  validates :hex_color, presence: true
  validates :red_color, presence: true
  validates :green_color, presence: true
  validates :blue_color, presence: true
end
