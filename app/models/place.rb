class Place < ApplicationRecord
  geocoded_by :address
  before_validation :geocode, if: -> { saved_change_to_address? || new_record? || latitude.nil? || longitude.nil? }
  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  belongs_to :user
  has_many :place_tags
  has_many :favorites

  accepts_nested_attributes_for :place_tags
end
