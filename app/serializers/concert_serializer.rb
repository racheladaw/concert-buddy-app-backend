class ConcertSerializer
  include FastJsonapi::ObjectSerializer
  attributes :date, :price_range, :upcoming
  belongs_to :location
  belongs_to :artist

  attribute :artist_name do |concert|
    "#{concert.artist.name}"
  end

  attribute :location_json do |concert|
    {
      city: concert.location.city,
      state: concert.location.state,
      country: concert.location.country
    }
  end
end
