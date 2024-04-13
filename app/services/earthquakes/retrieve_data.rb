# string_frozen_literal: true
module Earthquake
    class RetrieveData < ApplicationService

        def call
            response = Net::HTTP.get_response(url)
            earthquakes = JSON.parse(response.body)["features"]
            save_earthquakes(earthquakes)
        end

        private

        def url
            "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson"
        end

        def save_earthquakes(earthquakes)
            earthquakes.each do |eq|
                Earthquake.find_or_create_by( external_id: eq["id"]) do |earthquake|
                    earthquake.external_id = eq["id"]
                    earthquake.magnitude = eq["properties"]["mag"]
                    earthquake.place = eq["properties"]["place"]
                    earthquake.time = eq["properties"]["time"]
                    earthquake.tsunami = eq["properties"]["tsunami"]
                    earthquake.mag_type = eq["properties"]["magType"]
                    earthquake.title = eq["properties"]["title"]
                    earthquake.longitude = eq["geometry"]["coordinates"][0]
                    earthquake.latitude = eq["geometry"]["coordinates"][1]
                    earthquake.external_url = eq["properties"]["url"]
                end
            end
        end
    end
end