require 'rails_helper'
require 'spec_helper'
require 'rspec'
require 'pp'

RSpec.describe PerformersController, type: :controller do

    describe 'GET register' do
        it 'tests that it is a new performer' do
            get :register
            performer = assigns(:performer)
            expect(performer).to be_a_new(Performer)
            expect(performer).not_to be_persisted
        end
    end


end
