class Booking < ApplicationRecord  

  # associations
  belongs_to :client
  belongs_to :performer

  def self.create(
    client_id, client_name, client_location, client_contact, 
    performer_id, performer_name, performer_location, performer_contact,
    booking_date, booking_time,
    service_id, service_name, service_duration, service_fee)

    booking = Booking.new(
      client_id: client_id,      
      client_name: client_name,
      client_location: client_location,
      client_contact: client_contact,
      
      performer_id: performer_id, 
      performer_name: performer_name,
      performer_location: performer_location,
      performer_contact: performer_contact,

      booking_date: booking_date,
      booking_time: booking_time,
      
      service_id: service_id,
      service_name: service_name,
      duration: service_duration,
      fee: service_fee)
    booking.save
    booking
  end
end
