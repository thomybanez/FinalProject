class Booking < ApplicationRecord

    #associations
    belongs_to :client
    belongs_to :performer 

    def self.create_update(client_id, performer_id, service_id)
    booking = Booking.find_by(client_id: client_id, performer_id: performer_id)
    
        if booking
            booking.update(service_id: service_id)
            puts "YESSSSSSSSSS #{booking.inspect}"
        else
            booking = Booking.new(client_id: client_id, performer_id: performer_id, service_id: service_id)
            booking.save
            puts "NOOOOOOOOOOO #{booking.inspect}"
        end
    
    booking
    end
    

end
