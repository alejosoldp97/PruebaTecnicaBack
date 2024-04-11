class EarthquackesController < ApplicationController
URL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson"

    def index
        earthquackes = Earthquacke.all 
        #debugger
        earthquackes = filter_data(earthquackes)
        response = serialize_response(earthquackes)
        render json: response
    end

    def serialize_response(earthquackes)
        rendered_data = {
            "data": earthquackes.map do |earthquake|
                {
                "id": earthquake.id,
                "type": "feature",
                "attributes": {
                    "external_id": earthquake.external_id,
                    "magnitude": earthquake.magnitude,
                    "place": earthquake.place,
                    "time": earthquake.time,
                    "tsunami": earthquake.tsunami,
                    "mag_type": earthquake.mag_type,
                    "title": earthquake.title,
                    "coordinates": {
                    "longitude": earthquake.longitude,
                    "latitude": earthquake.latitude
                    }
                },
                "links": {
                    "external_url": earthquake.external_url
                }
                }
            end,
            "pagination": {
                "current_page": 1, # Cambia esto según tu paginación real
                "total": earthquackes.count, # Total de terremotos
                "per_page": earthquackes.count # Cambia esto según el número de terremotos por página
            }
            }
    end

    def get_data
        response = Net::HTTP.get_response(URI(URL))
        earthquackes = JSON.parse(response.body)["features"]
        save_data(earthquackes)
    end

    def save_data(earthquackes)
        earthquackes.each do |eq|
                # debugger
                Earthquacke.find_or_create_by( external_id:eq["id"]) do |earthquacke|
                earthquacke.external_id=eq["id"]
                earthquacke.magnitude=eq["properties"]["mag"]
                earthquacke.place=eq["properties"]["place"]
                earthquacke.time=eq["properties"]["time"]
                earthquacke.tsunami=eq["properties"]["tsunami"]
                earthquacke.mag_type=eq["properties"]["magType"]
                earthquacke.title=eq["properties"]["title"]
                earthquacke.longitude=eq["geometry"]["coordinates"][0]
                earthquacke.latitude=eq["geometry"]["coordinates"][1]
                earthquacke.external_url=eq["properties"]["url"]
                end
            
        end
    end

    def filter_data(earthquackes)
        filters=params[:filters]
        return earthquackes if filters.blank?
        #debugger
        filtered_eq = earthquackes.where(mag_type: filters[:mag_type])
    end
end
