class User < ApplicationRecord
  has_secure_password
  has_many :saved_concerts
  has_many :concerts, through: :saved_concerts
  belongs_to :location

  validates :name, :username, presence: true
  validates :username, uniqueness: true
end
