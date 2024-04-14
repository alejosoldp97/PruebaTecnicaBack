module Earthquakes
  class RetrieveData < ApplicationService
    URL = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson'

    def call
      response = Net::HTTP.get_response(URI(URL))
      earthquakes = JSON.parse(response.body)['features']
      save_earthquakes(earthquakes)
    rescue StandardError => e
      Rails.logger.error "Earthquakes::RetrieveData: #{e}"
    end

    private

    def save_earthquakes(earthquakes)
      earthquakes.each do |eq| 
        begin
          Earthquake.find_or_create_by(external_id: eq['id']) do |earthquake|
            earthquake.external_id = eq['id']
            earthquake.magnitude = eq['properties']['mag']
            earthquake.place = eq['properties']['place']
            earthquake.time = eq['properties']['time']
            earthquake.tsunami = eq['properties']['tsunami']
            earthquake.mag_type = eq['properties']['magType']
            earthquake.title = eq['properties']['title']
            earthquake.longitude = eq['geometry']['coordinates'][0]
            earthquake.latitude = eq['geometry']['coordinates'][1]
            earthquake.external_url = eq['properties']['url']
          end
        rescue StandardError => error
          Rails.logger.error "Earthquakes::RetrieveData#save_earthquakes #{error}"
        end            
      end
    end
  end
end
