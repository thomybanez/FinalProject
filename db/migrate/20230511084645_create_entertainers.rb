class CreateEntertainers < ActiveRecord::Migration[7.0]
  def change
    create_table :performers do |t|
      t.string :account_name
      t.string :password
      t.string :email
      t.string :contact_number
      t.string :stage_name
      t.integer :age
      t.string :gender
      t.string :location
      t.text :description
      t.float :ratings
      t.boolean :availability

      t.timestamps
    end
  end
end
