class Performer < ApplicationRecord
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
        performer = Performer.find_by(email: email)

        if performer && BCrypt::Password.new(performer.password_digest) == password
            performer.generate_token
            return performer
        else
            false
        end
    end








end
