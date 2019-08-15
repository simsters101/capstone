class Destination < ApplicationRecord
  def origin_trips
    Trip.where(destination_id1: id)
  end

  def destiny_trips
    Trip.where(destination_id2: id)
  end

  def origin_trip_destinys
    destinys = []
    origin_trips.map do |origin_trip|
      destinys << origin_trip.destiny # unless destinys.include?(origin_trip.destiny)
    end
    return destinys
  end
end
