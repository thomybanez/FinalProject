class Performer < ApplicationRecord
  # active storage
  has_many_attached :photos

  # bcrypt
  has_secure_password

  # validations
  validates :email, presence: true

  # associations
  has_one :wallet, as: :owner

  #factory bot
  has_many :bookings

  
  has_many :service

  # callbacks
  after_create :create_wallet

  def resize_photos(photos)
    photos.each do |photo|
      if photo.blob.byte_size < 400.kilobytes
        # Enlarge the image if it's too small
        photo.variant(resize_to_fill: [1000, 1000]).processed
      elsif photo.blob.byte_size > 2.megabytes
        # Shrink the image if it's too large
        photo.variant(resize_to_limit: [1000, 1000]).processed
      end
    end
  end

  def create_wallet
    build_wallet(balance: 0).save
  end

  def generate_token
    self.token = SecureRandom.urlsafe_base64
    save!
  end

  def self.authenticate(email, password)
    performer = Performer.find_by(email:)

    if performer && BCrypt::Password.new(performer.password_digest) == password
      performer.generate_token
      performer
    else
      false
    end
  end
end
