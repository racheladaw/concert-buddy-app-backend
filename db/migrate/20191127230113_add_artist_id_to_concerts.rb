class AddArtistIdToConcerts < ActiveRecord::Migration[5.2]
  def change
    add_column :concerts, :artist_id, :integer
  end
end
