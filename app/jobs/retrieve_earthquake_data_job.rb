class RetrieveEarthquakeDataJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    Earthquakes::RetrieveData.call
  rescue StandardError => e
    Rails.logger.error "RetrieveEarthquakeDataJob: #{e}"
  end
end
