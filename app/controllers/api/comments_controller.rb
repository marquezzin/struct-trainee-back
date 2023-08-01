class Api::CommentsController < ApplicationController
    acts_as_token_authentication_handler_for User, only: [:create, :update, :delete]
    before_action :admin_authentication, only: [:create, :update, :delete]

    def create
        comment = Comment.new(comment_params)
        comment.save!
        render json: comment, status: :created
    rescue StandardError => e
        render e, status: :bad_request 
    end

    def index
        comment = Comment.all
        render json: array_serializer(comment), :except => [:created_at, :updated_at], status: :ok
    end

    def show
        comment = Comment.find(params[:id])
        render json: serializer(comment), status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def update 
        comment = Comment.find(params[:id])
        comment.update!(comment_params)
        render json: comment, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found #404 ou :bad_request #400
    end

    def delete
        comment = Comment.find(params[:id])
        comment.destroy!
        render json: comment, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request 
    end

    private

    def array_serializer(comments)
        Panko::ArraySerializer.new(comments, each_serializer: CommentSerializer).to_json
    end

    def serializer(comment)
        CommentSerializer.new.serialize_to_json(comment)
    end

    def comment_params
        params.require(:comment).permit(:content, :post_id, :user_id)
    end
end
