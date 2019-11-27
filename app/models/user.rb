class User < ApplicationRecord
  has_secure_password
  has_many :saved_concerts
  has_many :concerts, through: :saved_concerts
  belongs_to :location
end
