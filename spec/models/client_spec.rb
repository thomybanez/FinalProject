require 'rails_helper'
require 'spec_helper'
require 'rspec'
require 'pp'

RSpec.describe Client, type: :model do
  
  it 'should have an email' do
    expect { Client.create!(email: '123') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'will make a new client' do
    expect { Client.new(email: 'test@example.com') }.to_not raise_error
  end

  it 'new client again' do
    client = Client.new(email: 'test@example.com', password: 'test')
    expect { client.save }.to_not raise_error
    auth_client = Client.find_by_email('test@example.com')
    puts "Actual client: #{auth_client.inspect}"
    expect(auth_client).to eq(client)
  end

  describe '#initialize' do
    it 'creates a new client with the specified attributes' do
      email = 'example@example.com'
      password = 'John Doe'

      client = Client.create(email:, password:)
      auth_client = Client.find_by(email:).authenticate(password)

      expect(auth_client).to eq(client)
    end
  end
end
