module Api
  module V1
    module Admin
      class ProductsController < ApplicationController
        def index
          products = Product.all
          render json: products, status: :ok
        end

        def create
          product = Product.new(product_params)
          if product.save
            render json: product, status: :created
          else
            render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def update
          product = Product.find(params[:id])
          if product.update(product_params)
            render json: product, status: :ok
          else
            render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def destroy
          product = Product.find(params[:id])
          product.destroy
          render json: { message: "Product deleted" }, status: :ok
        end

        private

        def product_params
          params.require(:product).permit(:name, :description, :price, :category)
        end
      end
    end
  end
end
