class Concert < ApplicationRecord
  has_many :saved_concerts
  has_many :users, through: :saved_concerts
end
