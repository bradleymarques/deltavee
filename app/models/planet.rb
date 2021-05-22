class Planet < ApplicationRecord
  validates :planet_name, presence: true
  validates :x, presence: true
  validates :y, presence: true
  validates :z, presence: true
  validates :star_name, presence: true
  validates :ra, presence: true
  validates :dec, presence: true

  belongs_to :star, required: true

  enum planet_status: {
    confirmed: 0
  }

  enum detection_type: {
    default: 0,
    radial_velocity: 1,
    imaging: 2,
    primary_transit: 3,
    timing: 4,
    astrometry: 5,
    ttv: 6,
    microlensing: 7
  }, _prefix: true

  enum mass_detection_type: {
    radial_velocity: 0,
    spectrum: 1,
    ttv: 2,
    astrometry: 3,
    theoretical: 4,
    timing: 5,
    microlensing: 6
  }, _prefix: true

  enum radius_detection_type: {
    theoretical: 0,
    primary_transit: 1,
    flux: 2
  }, _prefix: true
end
