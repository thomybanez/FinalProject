class BookingsController < ApplicationController   

    def new
        @client = Client.find_by(token: session[:client_token])
        @performer = Performer.find(params[:id])
        @booking = Booking.new(booking_create_params)
        @booking.client_id = @client.id
        @booking.performer_id = @performer.id
        @booking.save
        
        if @booking.save
            redirect_to bookings_show_path
            puts "SUCESSSSSSSSSSSSSSSSSSSSSSSSSSSSS"
        else
            redirect_to clients_show_path
            puts " FAIFAKFIUFAIFAIFIAFIAFIAFIAIFAI"
        end
        
    end

    def show
        @client = Client.find_by(token: session[:client_token])
        @booking = Booking.find_by(client_id: @client)
    end

    private
    def booking_create_params
        params.require(:booking).permit(:service_id)
    end    
   
end