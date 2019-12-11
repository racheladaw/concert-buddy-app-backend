class Location < ApplicationRecord
  has_many :concerts
  has_many :users

  validates :city, :state, :country, presence: true
end
