class Api::UsersController < ApplicationController
    acts_as_token_authentication_handler_for User, only: [:index, :show, :update, :delete]
    before_action :admin_authentication, only: [:index]

    def create
        user = User.new(user_params)
        user.save!
        render json: user, status: :created #201
    rescue StandardError => e
        render json: e, status: :bad_request 
    end

    def index
        user = User.all
        render json: array_serializer(user), :except => [:created_at, :updated_at], status: :ok
    end

    def show
        user = User.find(params[:id])
        render json: serializer(user), status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def update 
        user = User.find(params[:id])
        user.update!(user_params)
        render json: user, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found #404 ou :bad_request #400
    end

    def delete
        user = User.find(params[:id])
        user.destroy!
        render json: user, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request 
    end

    def login
        user = User.find_by(email: params[:email])
        if user.valid_password?(params[:password])
            render json: user, status: :ok
        else
            head :unauthorized
        end
    rescue StandardError => e
        render json: e, status: :unauthorized
    end

    private

    def array_serializer(users)
        Panko::ArraySerializer.new(users, each_serializer: UserSerializer).to_json
    end

    def serializer(user)
        UserSerializer.new.serialize_to_json(user)
    end

    def user_params
        params.require(:user).permit(:name, :email, :is_admin, :password, :bio, :points, :profile_picture)
    end
end
