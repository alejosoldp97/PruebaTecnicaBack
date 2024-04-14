class Api::V1::CommentsController < ApplicationController
  include ::CommentsParams

  # GET /api/v1/comments
  def index
    comment = Comment.where(earthquake_id:)
    render json: comment.pluck(:body)
  end

  # POST /api/v1/comments
  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment.to_json, status: :ok
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:earthquake_id, :body)
  end
end
