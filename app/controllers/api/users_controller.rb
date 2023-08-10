class Api::UsersController < ApplicationController
    acts_as_token_authentication_handler_for User, only: [:index, :show, :update, :update_password, :delete, :logout]
    before_action :admin_authentication, only: [:index]

    def create
        user = User.create!(user_params)
        user.save!
        render json: serializer(user), status: :created #201
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
        user.update!(user_update_params)
        render json: serializer(user), status: :ok
    rescue StandardError => e
        render json: e, status: :not_found #404 ou :bad_request #400
    end

    def update_password
        user = User.find(params[:id])
        user.update!(user_update_password_params)
        render json: user, status: :ok
    rescue ActiveRecord::RecordInvalid => e
        render json: {message: e.message}, status: :unprocessable_entity
    rescue ActiveRecord::RecordNotFound => e
        render json: {message: e.message}, status: :not_found
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
            render json: serializer(user), status: :ok
        else
            head :unauthorized
        end
    rescue StandardError => e
        render json: e, status: :unauthorized
    end

    def logout
        current_user.authentication_token = nil
        current_user.save!
        head(:ok)
    rescue StandardError => e
        render json:{message:e.message} ,status: :bad_request
    end

    private

    def array_serializer(users)
        Panko::ArraySerializer.new(users, each_serializer: UserSerializer).to_json
    end

    def serializer(user)
        UserSerializer.new.serialize_to_json(user)
    end

    def user_params # CREATE
        params.require(:user).permit(:name, :email, :is_admin, :password, :password_confirmation, :bio, :points, :profile_picture)
    end

    def user_update_params # UPDATE
        params.require(:user).permit(:name, :bio, :profile_picture)
    end

    def user_update_password_params # UPDATE_PASSWORD
        params.require(:user).permit(:password, :password_confirmation)
    end
end
