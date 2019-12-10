class ArtistSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  has_many :concerts
end
