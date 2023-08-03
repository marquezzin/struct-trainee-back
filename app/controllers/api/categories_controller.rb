class Api::CategoriesController < ApplicationController

    def create
        category = Category.new(category_params)
        category.save!
        render json: serializer(category), status: :created #201
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def index
        category = Category.all
        render json: array_serializer(category), :except => [:created_at, :updated_at], status: :ok
    end

    def show
        category = Category.find(params[:id])
        render json: serializer(category), status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def update
        category = Category.find(params[:id])
        category.update!(category_params)
        render json: serializer(category), status: :ok
    rescue StandardError => e
        render json: e, status: :not_found #404 ou :bad_request #400
    end

    def delete
        category = Category.find(params[:id])
        category.destroy!
        render json: category, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    private

    def array_serializer(categories)
        Panko::ArraySerializer.new(categories, each_serializer: CategorySerializer).to_json
    end

    def serializer(category)
        CategorySerializer.new.serialize_to_json(category)
    end

    def category_params
        params.require(:category).permit(:name)
    end
end
