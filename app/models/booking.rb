class Booking < ApplicationRecord
  # associations
  belongs_to :client
  belongs_to :performer

  def self.create_update(client_id, performer_id, service_id)
    booking = Booking.find_by(client_id:)

    if booking
      booking.update(service_id:, performer_id:)
      booking.save
    else
      booking = Booking.new(client_id:, performer_id:, service_id:)
      booking.save
    end
    booking
    
  end
end
