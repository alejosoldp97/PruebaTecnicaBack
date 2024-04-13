module EarthquackeResponse
    extend ActiveSupport::Concern

    def earthquacke_response(earthquackes, pagy)
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
                "current_page": pagy.page, # Cambia esto según tu paginación real
                "total": pagy.pages, # Total de terremotos
                "per_page": pagy.items # Cambia esto según el número de terremotos por página
            }
            }
    end

end