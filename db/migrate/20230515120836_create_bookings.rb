class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :client
      t.boolean :client_paid
      t.references :performer
      t.boolean :performer_accepted
      t.references :service
      t.string :transaction_status

      t.timestamps
    end
  end
end
