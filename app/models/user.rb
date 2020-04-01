class User < ApplicationRecord
  has_secure_password
  has_many :saved_concerts, dependent: :destroy
  has_many :concerts, through: :saved_concerts
  belongs_to :location

  has_one_attached :profile_picture

  validates :name, :username, presence: true
  validates :username, uniqueness: true
end
