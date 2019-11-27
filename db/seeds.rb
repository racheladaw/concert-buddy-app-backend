# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# rachel = User.create(name: "Rachel", username: "rachelw", password: "password")
#
# concert1 = Concert.create(date: "11-28-2019", price_range: "50-100", upcoming: true)
#
# rachel.saved_concerts.create(concert_id: concert1)

# seattle = Location.create(city: "Seattle", state: "Washington", country: "United States of America")
# rachel.update(location: seattle)
# concert1.update(location: seattle)

# vulfpeck = Artist.create(name: "Vulfpeck")
# concert1.update(artist: vulfpeck)

rachel = User.first
concert1 = Concert.first
seattle = Location.first
vulfpeck = Artist.first
