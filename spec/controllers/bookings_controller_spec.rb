require 'rails_helper'
require 'pp'

RSpec.describe BookingsController, type: :controller do

    describe "#submit" do
        it "assigns the correct client" do
            @client = Client.new(token: "sample_token")
            session[:client_token] = "sample_token"  
            expect(session[:client_token]).to eq("sample_token")
        end

        it "create a new booking" do
            @client_id = 1
            @performer_id = 1
            @service_id = 1
                @booking = Booking.new(client_id: @client_id, performer_id: @performer_id, service_id: @service_id)
                @booking.save
            
                expect(@booking.client_id).to eq(@client_id)
                expect(@booking.performer_id).to eq(@performer_id)
                expect(@booking.service_id).to eq(@service_id)
                expect(@booking.save).to be_truthy
                expect(@booking).to be_persisted
                
        end

        it "create a new booking" do
            @booking = Booking.new(client_id: @client_id, performer_id: @performer_id, service_id: @service_id)
            expect(@booking).to be_new_record
        end

   






    end
end
  
  