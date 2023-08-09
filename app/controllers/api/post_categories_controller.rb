class Api::PostCategoriesController < ApplicationController
    def index
        post_category = PostCategory.all
        render json: array_serializer(post_category), :except => [:created_at, :updated_at], status: :ok
    end

    def show
        post_category = PostCategory.find(params[:id])
        render json: serializer(post_category), status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    private

    def array_serializer(post_categories)
        Panko::ArraySerializer.new(post_categories, each_serializer: PostCategorySerializer).to_json
    end

    def serializer(post_category)
        PostCategorySerializer.new.serialize_to_json(post_category)
    end

    def post_category_params
        params.require(:post_category).permit(:post_id, :category_id)
    end
end
