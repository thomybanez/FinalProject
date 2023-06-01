require 'rails_helper'
require 'spec_helper'
require 'rspec'
require 'pp'

RSpec.describe BookingsController, type: :controller do 

        describe 'POST create' do           
            it "returns true when client token is present in the session" do
                session[:client_token] = "valid_token"                
                expect(session[:client_token].present?).to be true
            end            
        end

        describe 'GET show' do
            it 'assigns @client and @bookings when client session is present' do
                client = FactoryBot.create(:client)                
                session[:client_token] = client.token              
              
                get :show
              
                expect(assigns(:client)).to eq(client)
                expect(assigns(:bookings)).to match_array(client.bookings)
                expect(assigns(:services)).to be_a(Hash)
                expect(assigns(:services)).to be_empty

                client.bookings.each do |booking|
                    expect(assigns(:services)[booking.id]).to eq(Service.find_by(id: booking.service_id))
                end
            end

            it 'assigns @performer and @bookings when performer session is present' do
                performer = FactoryBot.create(:performer)
                session[:performer_token] = performer.token

                get :show

                expect(assigns(:performer)).to eq(performer)
                expect(assigns(:bookings)).to match_array(performer.bookings)
                expect(assigns(:services)).to be_a(Hash)
                expect(assigns(:services)).to be_empty

                performer.bookings.each do |booking|
                    expect(assigns(:service)[booking.id]).to eq(Service.find_by(id: booking.service_id))
                end
            end
        end



 
end
  
  