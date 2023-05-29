class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :client
      t.string :client_name, default: 'client name'
      t.string :client_location, default: 'location'
      t.integer :client_contact, default: 'phone'
      t.references :performer 
      t.string :performer_name, default: 'performer name'
      t.string :performer_location, default: 'location'
      t.string :performer_contact, default: 'phone'
      t.string :performer_accepted, default: 'pending'
      t.references :service
      t.string :service_name, default: 'service name'
      t.string :duration, default: 'duration'
      t.integer :fee, default: 'fee'
      t.date :booking_date
      t.time :booking_time
      t.string :transaction_status, default: 'incomplete'

      t.timestamps
    end
  end
end
