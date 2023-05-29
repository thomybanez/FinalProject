class BookingsController < ApplicationController
  def create
    @client = Client.find_by(token: session[:client_token])
    @selected_performer = Performer.find_by(id: session[:selected_performer])

    @client_name = @client.nick_name
    @client_location = @client.location
    @client_contact = @client.contact_number

    @performer_name = @selected_performer.stage_name
    @performer_location = @selected_performer.location
    @performer_contact = @selected_performer.contact_number
    puts "Booking Month: #{params[:booking][:booking_month]}"
    puts "Booking Day: #{params[:booking][:booking_day]}"

    current_year = Time.current.year
    @booking_date = Date.new(current_year, params[:booking][:booking_month].to_i, params[:booking][:booking_day].to_i)
    @booking_time = Time.zone.parse(params[:booking][:booking_time])
    

    if params[:booking].present? && params[:booking][:service_id].present?
      session[:selected_service] = params[:booking][:service_id]

      @selected_service = Service.find_by(id: session[:selected_service])
      @service_name = @selected_service.service_name
      @service_duration = @selected_service.duration
      @service_fee = @selected_service.fee

      booking = Booking.create(
        @client.id, @client_name, @client_location, @client_contact,
        @selected_performer.id, @performer_name, @performer_location, @performer_contact,
        @booking_date, @booking_time,
        @selected_service.id, @service_name, @service_duration, @service_fee)
      redirect_to bookings_show_path
    else
      redirect_to clients_show_path(@selected_performer)
    end
  end

  def show
    if session[:client_token].present?
      @client = Client.find_by(token: session[:client_token])
      @bookings = Booking.where(client_id: @client.id)
    elsif session[:performer_token].present?
      @performer = Performer.find_by(token: session[:performer_token])
      @bookings = Booking.where(performer_id: @performer.id)
    end
    
    @services = {}
    @bookings ||= [] # Assign an empty array if @bookings is nil
    
    @bookings.each do |booking|
      @services[booking.id] = Service.find_by(id: booking.service_id)
    end
  end

  def cancel
    
      

  end

  def accept
    @booking = Booking.find_by(id: params[:id])
  
    if @booking.performer_accepted == "pending"
      @booking.update(performer_accepted: "Accepted")      
    end
    redirect_to bookings_show_path
  end

  def reject
  end
    

 

  private
  def booking_create_params
    params.require(:booking).permit(:service_id)
  end
end
