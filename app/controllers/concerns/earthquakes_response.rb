module EarthquakesResponse
  extend ActiveSupport::Concern

  def earthquake_response(earthquakes)
    pagy, collection = pagy(earthquakes, items: per_page, page: page)
    {
      data: collection.as_json
    }.merge(pagination(pagy))
  end

  def pagination(pagy)
    {
      pagination: {
        current_page: pagy.page,
        total: pagy.pages,
        per_page: pagy.items
      }
    }
  end
end
