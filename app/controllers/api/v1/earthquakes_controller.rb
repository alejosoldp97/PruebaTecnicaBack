class Api::V1::EarthquakesController < ApplicationController
  include ::EarthquakesParams
  include ::EarthquakesResponse

  # GET /api/v1/earthquakes
  def index
    earthquakes = Earthquake.where(mag_type_filter)
    render json: earthquake_response(earthquakes)
  end

  # POST /api/v1/earhquakes
  def update_data
    RetrieveEarthquakeDataJob.perform_later
    head :no_content
  end

  private

  def mag_type_filter
    { mag_type: mag_type } if mag_type.present?
  end
end
