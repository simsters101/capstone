class Trip < ApplicationRecord
  def sentence
    "A trip from #{Destination.find_by(id: destination_id1).name} to #{Destination.find_by(id: destination_id2).name} would cost you $#{price}."
  end

  def origin
    Destination.find_by(id: destination_id1)
  end

  def destiny
    Destination.find_by(id: destination_id2)
  end
end
