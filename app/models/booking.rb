class Booking < ApplicationRecord

    #associations
    belongs_to :client
    belongs_to :performer
    

end
