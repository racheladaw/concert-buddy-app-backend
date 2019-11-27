class CreateConcerts < ActiveRecord::Migration[5.2]
  def change
    create_table :concerts do |t|
      t.date :date
      t.string :price_range
      t.boolean :upcoming

      t.timestamps
    end
  end
end
