module Api
  module V1
    class CartItemsController < ApplicationController
      def create
        cart = current_cart
        customizations = params[:customizations]
        customizations.each do |part_id, option_id|
          customization = Customization.find_or_create_by(
            product_id: params[:product_id],
            part_id: part_id,
            option_id: option_id
          )
          cart.cart_items.create(customization: customization)
        end
        render json: { message: "Items added to cart" }, status: :created
      end

      def destroy
        cart_item = CartItem.find(params[:id])
        cart_item.destroy
        render json: { message: "Item removed from cart" }, status: :ok
      end

      private

      def current_cart
        @current_cart ||= Cart.find_or_create_by(user_id: session[:user_id])
      end
    end
  end
end
