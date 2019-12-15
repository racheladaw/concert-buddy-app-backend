require 'rest-client'

class Location < ApplicationRecord
  has_many :concerts
  has_many :users

  validates :city, :state, :country, presence: true

  def get_concert_data
    seat_geek_url = "https://api.seatgeek.com/2/events?venue.city=#{self.city}&taxonomies.name=concert"
    data = JSON.parse(RestClient.get("#{seat_geek_url}&client_id=#{ENV['SEAT_GEEK_CLIENT_ID']}"))
  end
end
