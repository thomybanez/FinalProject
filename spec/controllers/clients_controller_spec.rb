require 'rails_helper'
require 'spec_helper'
require 'rspec'
require 'pp'

RSpec.describe ClientsController, type: :controller do

    describe 'GET register' do
        it 'tests that it is a new client' do
            get :register
            client = assigns(:client)
            expect(client).to be_a_new(Client)
            expect(client).not_to be_persisted
        end
    end

    describe 'GET #create' do
        it 'raises a ParameterMissing error' do
          expect {
            get :create
          }.to raise_error(ActionController::ParameterMissing)
        end
    end    

    describe 'POST create' do
        let(:client_account_params) do
          {
            email: "test@example.com",
            password: "password",
            contact_number: "1234567890",
            nick_name: "TestClient",
            age: 25,
            gender: "Female",
            location: "New York"
          }
        end        
    
        it 'creates a new client with client_account_params' do          
          post :create, params: { client: client_account_params }    
          expect(response).to redirect_to(clients_login_path)
          
          client = Client.first
          expect(client.email).to eq("test@example.com")
          expect(client.password).to eq("password")
          expect(client.contact_number).to eq("1234567890")
          expect(client.nick_name).to eq("TestClient")
          expect(client.age).to eq(25)
          expect(client.gender).to eq("Female")
          expect(client.location).to eq("New York")
        end
    
        it 'renders :register with status :unprocessable_entity if client is not saved' do
          allow_any_instance_of(Client).to receive(:save).and_return(false)
    
          post :create, params: { client: client_account_params }
    
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response).to render_template(:register)
        end
      end
end
