class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :username
  belongs_to :location

  attribute :location_json do |user|
    {
      city: user.location.city,
      state: user.location.state,
      country: user.location.country
    }
  end
end
