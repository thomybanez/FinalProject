class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|      
      t.string :email
      t.string :password_digest
      t.string :contact_number
      t.string :nick_name
      t.integer :age
      t.string :gender
      t.string :location
      t.float :spent_amount

      t.timestamps
    end
  end
end
