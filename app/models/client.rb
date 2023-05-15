class Client < ApplicationRecord
    has_secure_password
    validates :email, presence: true


    def self.authenticate(email, password)
        client = Client.find_by(email: email)

        if client && BCrypt::Password.new(client.password_digest) == password
            true
        else
            false
        end
    end    
end
