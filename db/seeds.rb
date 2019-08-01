# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'http'

# response = HTTP.get("https://pkgstore.datahub.io/core/airport-codes/airport-codes_json/data/7fd9ada72fd1c808e73f0f329428d094/airport-codes_json.json")

# response = response.parse

# large_airports = []

# response.map do |destination|
#   if destination["type"] == "large_airport"
#     large_airports << destination
#   end
# end

# large_airports.map do |airport|
#   name = airport["municipality"]
#   continent = airport["continent"]
#   airport_code = airport["iata_code"]
#   country = airport["iso_country"]
#   Destination.create(name: name, continent: continent, airport_code: airport_code, country: country)
# end
