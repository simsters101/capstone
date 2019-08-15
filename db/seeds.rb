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





require "http"

# Destination.limit(3).each do |destination1|
#   Destination.limit(3).each do |destination2|

Destination.where("id > '79'").where("id < '100'").each do |destination1|
  Destination.all.each do |destination2|

# Destination.where("id > '69'").each do |destination1|
#   Destination.all.each do |destination2|

# Destination.find_by(id: 69) do |destination1|
#   Destination.where("id > '36'").each do |destination2|


    if destination1.id != destination2.id && Trip.find_by(destination_id1: destination1.id, destination_id2: destination2.id) == nil
      
      response = HTTP.get "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsequotes/v1.0/US/USD/en-US/#{destination1.airport_code}-sky/#{destination2.airport_code}-sky/anytime?inboundpartialdate=anytime",
      headers: {
        "X-RapidAPI-Host" => "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
        "X-RapidAPI-Key" => ""
      }

      if response && response.parse
        response = response.parse
      
        if response.length == 4 && response["Quotes"] != []
          Trip.create(destination_id1: destination1.id, destination_id2: destination2.id, price: response["Quotes"][0]["MinPrice"])
        end

      end

    end
  end
end



# *****************************************



# id = 3
# Destination.count.times do
#   destination = Destination.find_by(id: id)

#   response = HTTP.get "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsequotes/v1.0/US/USD/en-US/#{destination.airport_code}-sky/anywhere/anytime?inboundpartialdate=anytime",
#   headers: {
#     "X-RapidAPI-Host" => "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
#     "X-RapidAPI-Key" => "b6d4f81b1amsh00577e4c68cf036p153821jsn8728c97b1b5b"
#   }

#   response = response.parse

#   response["Places"].each do |place|
#     id2 = 3
#     Destination.count.times do
#       destination2 = Destination.find_by(id: id2)
#       if place["IataCode"] == destination2.airport_code
#         response["Quotes"].each do |quote|
#           if quote["OutboundLeg"]["DestinationId"] == place["PlaceId"]
#             Trip.create(destination_id1: destination.id, destination_id2: destination2.id, price: quote["MinPrice"]) if Trip.find_by(destination_id1: destination.id, destination_id2: destination2.id, price: quote["MinPrice"]) == nil
#           end
#         end
#       end
#       id2 += 1
#     end
#   end
#   id += 1
# end

