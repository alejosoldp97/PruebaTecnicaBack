class EarthquackesController < ApplicationController
URL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson"
    def get_data
        response = Net::HTTP.get_response(URI(URL))
        render json: JSON.parse(response.body)
    end
end
