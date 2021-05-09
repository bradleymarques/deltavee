class System < ApplicationRecord
  validates :name, presence: true
  validates :x, presence: true
  validates :y, presence: true
  validates :z, presence: true
end
