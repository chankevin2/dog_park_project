class Park < ApplicationRecord
  mount_uploader :park_photo, ParkPhotoUploader

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :description, presence: true
  has_many :reviews
end
