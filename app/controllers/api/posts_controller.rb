class Api::PostsController < ApplicationController
    acts_as_token_authentication_handler_for User, only: [:create, :update, :delete]
    before_action :admin_authentication, only: [:create, :update, :delete]

    def create
        post = Post.new(title:post_params[:title],content:post_params[:content],user_id:post_params[:user_id])
        post.save!
        pc = PostCategory.new(post_id:post.id,category_id:post_params[:category_id])
        pc.save!
        render json: serializer(post), status: :created #201
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def index
        post = Post.all
        render json: array_serializer(post), :except => [:created_at, :updated_at], status: :ok
    end

    def show
        post = Post.find(params[:id])
        render json: serializer(post), status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def update
        post = Post.find(params[:id])
        post.update!(post_params)
        render json: serializer(post), status: :ok
    rescue StandardError => e
        render json: e, status: :not_found #404 ou :bad_request #400
    end

    def delete
        post = Post.find(params[:id])
        post.destroy!
        render json: post, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    private

    def array_serializer(posts)
        Panko::ArraySerializer.new(posts, each_serializer: PostSerializer).to_json
    end

    def serializer(post)
        PostSerializer.new.serialize_to_json(post)
    end

    def post_params
        params.require(:post).permit(:title, :content, :upvotes, :user_id, :category_id)
    end
end
