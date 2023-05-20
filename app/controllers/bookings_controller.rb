class BookingsController < ApplicationController   

    def create        
        @client = Client.find_by(token: session[:client_token])
        @selected_performer = Performer.find_by(id: session[:selected_performer])
        session[:selected_service] = params[:booking][:service_id]
        @selected_service = Service.find_by(id: session[:selected_service])
        
        booking = Booking.create_update(@client.id, @selected_performer.id, @selected_service.id)     
        redirect_to bookings_show_path        
    end


    def show
        @client = Client.find_by(token: session[:client_token])        
        @booking = Booking.find_by(client_id: @client)
        @selected_performer = Performer.find_by(id: @booking.performer_id)
        @selected_service = Service.find_by(id: @booking.service_id)

    end

    def permission

    end

    private
    def booking_create_params
        params.require(:booking).permit(:service_id)
    end    
   
end