module EarthquakesParams
  extend ActiveSupport::Concern

  def page
    params[:page].present? ? params[:page].to_i : 1
  end

  def per_page
    params[:per_page].present? ? params[:per_page].to_i : 10
  end

  def mag_type
    params.dig(:filters, :mag_type)
  end
end