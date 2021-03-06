class User < ApplicationRecord
    
    has_secure_password
    
    has_many :bookings

    validates :name, presence: true
    validates :username, presence: true, uniqueness: true


end
