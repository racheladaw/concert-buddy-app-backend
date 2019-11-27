class AddLocationIdToConcerts < ActiveRecord::Migration[5.2]
  def change
    add_column :concerts, :location_id, :integer
  end
end
