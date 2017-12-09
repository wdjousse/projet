class Town < ActiveRecord::Base
  
  before_validation :geocode 
  validates :lat, :lon, presence: true
  
    private
    def geocode
    places = Nominatim.search(name).limit(1)
    if places.first
      self.lat = places.first.lat
      self.lon = places.first.lon
    end
  end
end
