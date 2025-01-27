module Api
  module V1
    class CartsController < ApplicationController
      def show
        cart = current_cart
        render json: cart.to_json(include: { cart_items: { include: { customization: { include: [:product, :part, :option] } } } }), status: :ok
      end

      private

      def current_cart
        @current_cart ||= Cart.find_or_create_by(user_id: session[:user_id])
      end
    end
  end
end