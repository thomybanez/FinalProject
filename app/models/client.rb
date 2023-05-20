class Client < ApplicationRecord
    #active storage
    has_many_attached :photos

    #bcrypt
    has_secure_password

    #validations
    validates :email, presence: true

    #associations
    has_one :wallet, as: :owner
    has_one :booking

    #callbacks
    after_create :create_wallet

    def create_wallet
        self.build_wallet(balance: 0).save
    end

    def generate_token
        self.token = SecureRandom.urlsafe_base64
        save!
    end

    def self.authenticate(email, password)
        client = Client.find_by(email: email)

        if client && BCrypt::Password.new(client.password_digest) == password
            client.generate_token
            return client
        else
            false
        end
    end


end
