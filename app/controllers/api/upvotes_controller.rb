class Api::UpvotesController < ApplicationController
    acts_as_token_authentication_handler_for User, only: [:create, :update, :delete]
    before_action :admin_authentication, only: [:create, :update, :delete]

    def create
        upvote = Upvote.new(upvote_params)
        upvote.save!
        render json: serializer(upvote), status: :created
    rescue StandardError => e
        render e, status: :bad_request
    end

    def index
        upvote = Upvote.all
        render json: array_serializer(upvote), :except => [:created_at, :updated_at], status: :ok
    end

    def show
        upvote = Upvote.find(params[:id])
        render json: serializer(upvote), status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def update
        upvote = Upvote.find(params[:id])
        upvote.update!(upvote_params)
        render json: serializer(upvote), status: :ok
    rescue StandardError => e
        render json: e, status: :not_found #404 ou :bad_request #400
    end

    def delete
        upvote = Upvote.find(params[:id])
        upvote.destroy!
        render json: upvote, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    private

    def array_serializer(upvotes)
        Panko::ArraySerializer.new(upvotes, each_serializer: UpvoteSerializer).to_json
    end

    def serializer(upvote)
        UpvoteSerializer.new.serialize_to_json(upvote)
    end

    def upvote_params
        params.require(:upvote).permit(:status, :post_id, :user_id)
    end
end
