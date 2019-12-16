class SavedConcert < ApplicationRecord
  belongs_to :user
  belongs_to :concert

  validates :concert_id, :uniqueness => {:scope => :user_id, message: "already saved"}
end
