class Concert < ApplicationRecord
  has_many :saved_concerts, dependent: :destroy
  has_many :users, through: :saved_concerts
  belongs_to :location
  belongs_to :artist
end
