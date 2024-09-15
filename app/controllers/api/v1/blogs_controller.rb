module Api
  module V1
    class BlogsController < ApplicationController
      before_action :set_blog, only: [ :show, :update, :destroy ]

      # GET /api/v1/blogs
      def index
        @blogs = Blog.all
        render json: @blogs
      end

      # GET /api/v1/blogs/1
      def show
        render json: @blog
      end

      # POST /api/v1/blogs
      def create
        @blog = Blog.new(blog_params)
        if @blog.save
          render json: @blog, status: :created
        else
          render json: @blog.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/blogs/1
      def update
        if @blog.update(blog_params)
          render json: @blog
        else
          render json: @blog.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/blogs/1
      def destroy
        @blog.destroy
        head :no_content
      end

      private

      def set_blog
        @blog = Blog.find(params[:id])
      end

      def blog_params
        params.require(:blog).permit(:name)
      end
    end
  end
end
