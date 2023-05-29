class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :category
      t.string :service_name
      t.integer :fee
      t.integer :duration
      t.references :performer

      t.timestamps
    end
  end
end
