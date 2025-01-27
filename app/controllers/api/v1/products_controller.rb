module Api
  module V1
    class ProductsController < ApplicationController
      def index
        products = Product.all
        render json: products, status: :ok
      end

      def show
        product = Product.find(params[:id])
        render json: product.to_json(include: { parts: { include: :options } }), status: :ok
      end
    end
  end
end
