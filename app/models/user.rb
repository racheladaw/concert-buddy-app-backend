class User < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_secure_password
  has_many :saved_concerts, dependent: :destroy
  has_many :concerts, through: :saved_concerts
  belongs_to :location

  has_one_attached :profile_picture

  validates :name, :username, presence: true
  validates :username, uniqueness: true

  def get_profile_picture_url
    if self.profile_picture.attached? 
      url_for(self.profile_picture)
    end
  end
end
