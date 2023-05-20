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
        timeout = 900 # Set the duration of the timer here (e.g., 900 seconds or 15 minutes)
    
        if cookies[:timer_started_at].nil?
          cookies[:timer_started_at] = Time.current.to_i
          @time_left = timeout
        else
          start_time = Time.at(cookies[:timer_started_at].to_i)
          time_passed = Time.current - start_time
          @time_left = [timeout - time_passed.to_i, 0].max
          reset_timer if @time_left.zero?
        end
      end
    
      private
    
        def reset_timer
            cookies.delete(:timer_started_at)
            # Add any additional logic you need when the timer reaches zero
        end
        
        def booking_create_params
        params.require(:booking).permit(:service_id)
    end    
   
end