class Earthquacke < ApplicationRecord
    has_many :comments
    validates :latitude, numericality: {greater_than_or_equal_to:-90, less_than_or_equal_to: 90}
    validates :longitude, numericality: {greater_than_or_equal_to:-180, less_than_or_equal_to: 180}
    validates :magnitude, numericality: {greater_than_or_equal_to:-1, less_than_or_equal_to: 10}
    validates :title, :external_url, :place, :mag_type, :latitude, :longitude, presence: true
end
