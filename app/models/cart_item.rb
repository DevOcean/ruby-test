class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :customization
end
