class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :username, :location
end
