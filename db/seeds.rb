

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




# require 'http'

# response = HTTP.get("https://pkgstore.datahub.io/core/country-list/data_json/data/8c458f2d15d9f2119654b29ede6e45b8/data_json.json")

# response = response.parse(:json)

# response.each do |country_set|
#   Destination.all.each do |destination|
#     if destination.country_code == country_set['Code']
#       destination.country = country_set['Name']
#       destination.save
#     end
#   end
# end




# require "http"

# # Destination.limit(3).each do |destination1|
# #   Destination.limit(3).each do |destination2|

# Destination.where("id > '0'").where("id < '21'").each do |destination1|
#   Destination.all.each do |destination2|

# # Destination.all.each do |destination1|
# #   Destination.all.each do |destination2|


#     if destination1.id != destination2.id && Trip.find_by(destination_id1: destination1.id, destination_id2: destination2.id) == nil
      
#       response = HTTP.get "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsequotes/v1.0/US/USD/en-US/#{destination1.airport_code}-sky/#{destination2.airport_code}-sky/anytime?inboundpartialdate=anytime",
#       headers: {
#         "X-RapidAPI-Host" => "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
#         "X-RapidAPI-Key" => ""
#       }

#       if response && response.parse
#         response = response.parse
      
#         if response.length == 4 && response["Quotes"] != []
#           Trip.create(destination_id1: destination1.id, destination_id2: destination2.id, price: response["Quotes"][0]["MinPrice"])
#         end

#       end

#     end
#   end
# end




# Not sure what this is:

#   response = HTTP.get "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsequotes/v1.0/US/USD/en-US/#{destination.airport_code}-sky/anywhere/anytime?inboundpartialdate=anytime",
#   headers: {
#     "X-RapidAPI-Host" => "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
#     "X-RapidAPI-Key" => ""
#   }





require "http"

Destination.all.each do |destination|

  p destination.name


  5.times do
    if destination.name[" "]
      destination.name[" "] = "+"
    end
  end


  if HTTP.get("https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=&text=#{destination.name}&sort=interestingness-desc&format=json&nojsoncallback=1")

    response = HTTP.get("https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=&text=#{destination.name}+city&sort=interestingness-desc&format=json&nojsoncallback=1")

    if response.parse(:json)['photos']['photo'][0]

      photo = response.parse(:json)['photos']['photo'][0]

      image_url = "https://farm#{photo["farm"]}.staticflickr.com/#{photo["server"]}/#{photo["id"]}_#{photo["secret"]}_c.jpg"

      5.times do
        if destination.name["+"]
          destination.name["+"] = " "
        else
          break
        end
      end

      destination.update(image: image_url)
      p destination.name
      p image_url
    end
  end
end
