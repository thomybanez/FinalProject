class Booking < ApplicationRecord

    #associations
    belongs_to :client
    belongs_to :performer

    validates :client_id, uniqueness: { scope: :performer_id, message: "can only create one booking" }
    validates :performer_id, uniqueness: { scope: :accepted, message: "can only accept one booking" }, if: :accepted?
    validates :accepted, inclusion: { in: [true, false] }
    

end
