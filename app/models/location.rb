class Location < ApplicationRecord
  has_many :concerts
  has_many :users
end
