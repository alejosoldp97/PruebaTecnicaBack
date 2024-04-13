class EarthquackesController < ApplicationController
    include EarthquackeResponse

    def index
        earthquackes = Earthquacke.all         
        earthquackes = filter_data(earthquackes)
        per_page = params[:per_page].present? ? params[:per_page].to_i : 10
        pagy, earthquackes = pagy(earthquackes, items: per_page)
        response = earthquacke_response(earthquackes, pagy)
        render json: response
    end

    def get_data
        Earthquake::RetrieveData.call
    end

    def filter_data(earthquackes)
        filters=params[:filters]
        return earthquackes if filters.blank?

        filtered_eq = earthquackes.where(mag_type: filters[:mag_type])
    end
end
