class System < ApplicationRecord
  validates :x_position, presence: true
  validates :y_position, presence: true
  validates :z_position, presence: true
  validates :proper_name, presence: true
end
