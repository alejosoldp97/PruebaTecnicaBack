module CommentsParams
  extend ActiveSupport::Concern

  # TODO: Paginar comentarios
  # def page
  #   params[:page].present? ? params[:page].to_i : 1
  # end

  # def per_page
  #   params[:per_page].present? ? params[:per_page].to_i : 10
  # end

  def earthquake_id
    params[:earthquake_id]
  end
end