require 'rails_helper'
require 'spec_helper'
require 'rspec'
require 'pp'

RSpec.describe ServicesController, type: :controller do
    describe 'GET new' do
        it 'tests that it is a new service' do
            get :new
            service = assigns(:service)
            expect(service).to be_a_new(Service)
            expect(service).not_to be_persisted
        end
    end
end
