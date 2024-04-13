class CommentsController < ApplicationController
    def index
        comment = Comment.where(earthquacke_id: params[:earthquake_id])
        render json: comment.pluck(:body)
    end

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
        params.require(:comment).permit(:earthquacke_id, :body)
    end
end