class CommentsController < ApplicationController
    def index

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